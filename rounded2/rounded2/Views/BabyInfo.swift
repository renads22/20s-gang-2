//
//  amal.swift
//  rounded2
//
//  Created by Renad alkhathami on 12/06/1445 AH.
//

import SwiftUI
import SwiftData
import UserNotifications

class hapticManger {
    static let instance = hapticManger()
    func notification(type: UINotificationFeedbackGenerator.FeedbackType) {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(type)
    }
    func impact(style: UIImpactFeedbackGenerator.FeedbackStyle) {
        let generator = UIImpactFeedbackGenerator(style: style)
        generator.impactOccurred()
    }
}

struct BabyInfo: View {
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.modelContext) var modelContext

    @State private var userText: String = ""
    @State private var toggleIsOn: Bool = false
    @State var selection: Int = 2
    var requestIdentifier: String?
    @Environment(\.colorScheme) var colorScheme
    
    
    var body: some View {
        VStack {
            Text("Reminder Name")
                .font(.title)
                .foregroundColor(Color("TextColor"))

            TextField("Write the Reminder Name here", text: $userText)
                //.textFieldStyle(.roundedBorder)
                .padding(7)
                //.foregroundColor(colorScheme == .dark ? .black : .black)
                .background(colorScheme == .dark ? Color.gray.opacity(0.9) : .white)
                .overlay(
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(Color.black, lineWidth: 1) // تعيين لون الحدود بالأسود
                )

            Text("Repetition")
                .font(.title)
                .foregroundColor(Color("TextColor"))

            Text("Choose how many times you want to receive the notification")
                .foregroundColor(Color("TextColor"))
            Picker(selection: $selection, label: Text(""),
                   content: {
                ForEach(0..<7) { number in
                    if number > 1 {
                        Text("every \(number) hours")
                            .tag("\(number)")
                    }
                }
            })

            Button("Save") {
                var seconds = 0
                if selection == 1 {
                    seconds = 60
                } else {
                    seconds = 3600 * selection
                }
                let content = UNMutableNotificationContent()
                content.title = userText
                content.sound = UNNotificationSound.default

                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: selection == 1 ? 60 : TimeInterval(seconds), repeats: true)

                let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)

                UNUserNotificationCenter.current().add(request)

                let reminder = Riminder(title: userText, count: selection)
                reminder.requestIdentifier = request.identifier
                modelContext.insert(reminder)

                print("the item saved is \(userText) , \(selection)")

                hapticManger.instance.notification(type: .warning)
                hapticManger.instance.impact(style: .heavy)

                // Navigate to ContentView
                presentationMode.wrappedValue.dismiss()
            }
            .buttonStyle(BorderlessButtonStyle())
            .padding(.horizontal, 50)
            .padding(.vertical, 14)
            .foregroundColor(.white)
            .background(.color2)
            .cornerRadius(10)
        }
        .onAppear {
            UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                if success {
                    print("تم")
                } else if let error = error {
                    print(error.localizedDescription)
                }
            }
        }
        .padding()
        .background(
            Image("background1")
                .resizable()
                .scaledToFill()
                // Ensures the image fills the entire screen
                .ignoresSafeArea()
                .frame(width: 600, height: 500)
                // Move the image down slightly
        )
        
    }
}

#Preview {
    BabyInfo()
}

