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

struct amal: View {
    
    @Environment(\.modelContext) var modelContext

    @State private var userText: String = ""
   // @State private var timee = Date.now
    @State private var toggleIsOn : Bool = false
    @State var selection : Int = 2
    
    var body: some View {
        VStack {
            HStack {
                    Spacer()
                    Text("اسم التذكير")
                        .font(.title)
                }
                .multilineTextAlignment(.trailing)
            TextField("اكتب التذكير هنا", text: $userText )
                            .textFieldStyle(.roundedBorder)
                            //.padding()
                            .multilineTextAlignment(.trailing)
                            .overlay(
                                
                        RoundedRectangle(cornerRadius: 8)
                .stroke(Color.black, lineWidth: 1)// تعيين لون الحدود بالأسود
                                            )
            HStack {
                Spacer()
                Text("التكرار")
                    .font(.title)
            }
            Text("اختر كم مره تريد ان يصلك الاشعار")
            Picker(selection: $selection, label: Text(""),
                   content: {
                ForEach(2..<6) {
                   
                    number in Text("\(number)")
                        .tag("\(number)")
                }
                
            })
//            Button("السماح بالتذكير") {
//                UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
//                    if success {
//                        print("تم")
//                    } else if let error = error {
//                        print(error.localizedDescription)
//                    }}
//            }
            
            Button("تأكيد") {
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
                modelContext.insert(reminder)
                
                print("the item saved is \(userText) , \(selection)")

                hapticManger.instance.notification(type: .warning)
                
                hapticManger.instance.impact(style: .heavy)
                
                
            }
            
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
    amal()
}
