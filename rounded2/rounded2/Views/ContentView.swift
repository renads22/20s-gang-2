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
    
    var body: some View {
        NavigationView {
            
            VStack(spacing: 20) {

            NavigationLink(destination: BabyInfo()) {
                
                Image(systemName: "plus.circle")
                    .font(.system(size: 45))
                    .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                   
                    .padding(.leading, 300)
                    .navigationTitle("BabyTasks")
            }
            
            
                ScrollView{
                    
                    ForEach(reminders) { item in
                        
                        RoundedRectangle(cornerRadius: 18)
                            .frame(width: 300, height: 100)
                            .foregroundColor(Color.color2)
                            .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                            .overlay(
                                RoundedRectangle(cornerRadius: 18)
                                    .stroke(Color.black, lineWidth: 2)
                            )
                            .overlay(
                                HStack{
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
                
            }
            .padding()
        }
       
    }
}

#Preview {
    ContentView()
}
