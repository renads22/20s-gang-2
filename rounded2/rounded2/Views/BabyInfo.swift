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
   // @State private var timee = Date.now
    @State private var toggleIsOn : Bool = false
    @State var selection : Int = 2
    var requestIdentifier: String?

    var body: some View {
        VStack {

            
                    Text("Reminder Name")
                        .font(.title)
                      //  .multilineTextAlignment(.trailing)
            
            TextField("Write the Reminder Name here", text: $userText )
                            .textFieldStyle(.roundedBorder)
                            //.padding()
                           // .multilineTextAlignment(.trailing)
                            .overlay(
                                
                        RoundedRectangle(cornerRadius: 8)
                .stroke(Color.black, lineWidth: 1)// تعيين لون الحدود بالأسود
                                            )
           
                Text("Repetition")
                    .font(.title)

            Text("Choose how many times you want to receive the notification")
            Picker(selection: $selection, label: Text(""),
                   content: {
                ForEach(2..<6) {
                   
                    number in Text("\(number)")
                        .tag("\(number)")
                }
                
            })

            
            Button("Save") {
                var seconds = 0
                if selection == 1{
                   seconds = 60
                }
                else
                {
                   seconds = 3600 * selection
                }
                let content = UNMutableNotificationContent()
                content.title = userText
                content.sound = UNNotificationSound.default
                
                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: selection == 1 ? 60 : TimeInterval(seconds) , repeats: true)
                
                let reguest = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                
                UNUserNotificationCenter.current().add(reguest)
                
                
                let reminder = Riminder(title: userText, count: selection)
                reminder.requestIdentifier = reguest.identifier
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

            
        }.onAppear(perform: {
            UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                if success {
                    print("تم")
                } else if let error = error {
                    print(error.localizedDescription)
                }}
        })
        .padding()
    }
}

#Preview {
    BabyInfo()
}
