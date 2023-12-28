//
//  Renad2.swift
//  rounded2
//
//  Created by Renad alkhathami on 12/06/1445 AH.
//

import SwiftUI
import SwiftData
struct Renad2: View {
    
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
                
                //            RoundedRectangle(cornerRadius: 18)
                //                .frame(width: 300, height: 100)
                //                .foregroundColor(Color.babypink)
                //                .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                //                .offset(y: -40)
                //                .overlay(
                //                    RoundedRectangle(cornerRadius: 18)
                //                        .stroke(Color.black, lineWidth: 2)
                //                        .offset(y: -40)
                //                )
                //                .overlay(
                //                    VStack {
                //                        Text("")
                //                            .foregroundColor(.white)
                //                            .font(.title)
                //                            .offset(y: -38)
                //                        Text("")
                //                            .foregroundColor(.black)
                //                            .font(.subheadline)
                //                            .offset(y: -35)
                //                    }
                //                )
                //                .padding()
                
                //            RoundedRectangle(cornerRadius: 18)
                //                .frame(width: 300, height: 100)
                //                .foregroundColor(Color.babyyellow)
                //                .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                //                .offset(y: -80)
                //                .overlay(
                //                    RoundedRectangle(cornerRadius: 18)
                //                        .stroke(Color.black, lineWidth: 2)
                //                        .offset(y: -80)
                //                )
                //                .overlay(
                //                    VStack {
                //                        Text("")
                //                            .foregroundColor(.white)
                //                            .font(.title)
                //                            .offset(y: -80)
                //                        Text("")
                //                            .foregroundColor(.black)
                //                            .font(.subheadline)
                //                            .offset(y: -77)
                //                    }
                //                )
                //                .padding()
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Renad2()
    }
}
