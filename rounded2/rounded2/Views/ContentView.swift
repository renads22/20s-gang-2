//
//  ContentView.swift
//  rounded2
//
//  Created by Renad alkhathami on 07/06/1445 AH.
//
import SwiftUI
import SwiftData
import UserNotifications

struct ContentView: View {
   @Environment(\.modelContext) var modelContext
   @Query var reminders: [Riminder]
   
   init() {
      UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.black]
   }
   
   var body: some View {
      NavigationView {
         ZStack {
            Image("background1")
               .resizable()
               .scaledToFill()
               .ignoresSafeArea()
            
            VStack(spacing: 20) {
               NavigationLink(destination: BabyInfo()) {
                  Image(systemName: "plus.circle")
                     .font(.system(size: 55))
                     .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                     .padding(.leading, 300)
                     .navigationBarTitle("BabyTasks", displayMode: .inline)
                     .foregroundColor(Color("TextColor"))
               }
               
               // Use GeometryReader to adapt layout
               GeometryReader { geometry in
                  ScrollView {
                     VStack(spacing: 10) { // Adjust spacing if needed
                        ForEach(reminders) { item in
                           RoundedRectangle(cornerRadius: 18)
                              .frame(width: geometry.size.width - 40, height: 100) // Adjust width based on geometry
                              .foregroundColor(Color.color2)
                              .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                              .overlay(
                                 RoundedRectangle(cornerRadius: 18)
                                    .stroke(Color.black, lineWidth: 2)
                              )
                              .overlay(
                                 HStack {
                                    VStack {
                                       Text(item.title)
                                          .foregroundColor(.white)
                                          .font(.title)
                                       Text("")
                                          .foregroundColor(.black)
                                          .font(.subheadline)
                                          .offset(y: 5)
                                    }
                                    Spacer()
                                    Button(role: .destructive) {
                                       withAnimation {
                                          if let requestIdentifier = item.requestIdentifier {
                                             UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: [requestIdentifier])
                                          }
                                          modelContext.delete(item)
                                       }
                                    } label: {
                                       Label("Delete", systemImage: "trash")
                                          .symbolVariant(.fill)
                                    }
                                 }
                                    .padding(.horizontal)
                              )
                              .padding()
                        }
                     }
                     .padding(.bottom) // Add some padding at the bottom
                  }
                  .frame(width: geometry.size.width, height: geometry.size.height - 50) // Adjust height accordingly
               }
               .frame(maxWidth: .infinity, maxHeight: 600) // Make sure it takes available height
            }
            .padding()
         }
      }
      .navigationBarBackButtonHidden(true)
   }
}

#Preview {
   ContentView()
}
