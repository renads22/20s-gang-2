//
//  ContentView.swift
//  rounded2
//
//  Created by Renad alkhathami on 07/06/1445 AH.
//
import SwiftUI
import SwiftData
struct ContentView: View {
    
    @Query var reminders: [Riminder]
    
    var body: some View {
        NavigationView {
            
            VStack(spacing: 20) {

            NavigationLink(destination: amal()) {
                
                Image(systemName: "plus.circle")
                    .font(.system(size: 45))
                    .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                   // .offset(y: 30)
                  //  .offset(x: 120)
            }
            
            
            
             
                ForEach(reminders) { item in
                    
                    RoundedRectangle(cornerRadius: 18)
                        .frame(width: 300, height: 100)
                        .foregroundColor(Color.babyblue)
                        .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                        .overlay(
                            RoundedRectangle(cornerRadius: 18)
                                .stroke(Color.black, lineWidth: 2)
                        )
                        .overlay(
                            VStack {
                                Text(item.title)
                                    .foregroundColor(.white)
                                    .font(.title)
                                Text("")
                                    .foregroundColor(.black)
                                    .font(.subheadline)
                                    .offset(y: 5)
                            }
                        )
                        .padding()
                    
                    
                }
                
                
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
