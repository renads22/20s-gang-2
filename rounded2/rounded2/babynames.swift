//
//  babynames.swift
//  rounded2
//
//  Created by Renad alkhathami on 12/06/1445 AH.
//

import SwiftUI
import SwiftData
struct babynames: View {
    @Query var names : [names]
    var body: some View {
        NavigationView {
                    
                
                    VStack(spacing: 20) {
                        
                        NavigationLink (destination: names2()) {
                            Image(systemName: "plus.circle")
                                .font(.system(size: 45))
                                .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                        }
                        ForEach(names) {item in
                            RoundedRectangle(cornerRadius: 18)
                                .frame(width: 300, height: 45)
                                .foregroundColor(Color.color1)
                                .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 18)
                                        .stroke(Color.black, lineWidth: 2)
                                )
                                .overlay(
                                    VStack {
                                        Text("")
                                            .foregroundColor(.white)
                                            .font(.title)
                                        
                                    }
                                )
                                .padding()
                            
                            RoundedRectangle(cornerRadius: 18)
                                .frame(width: 300, height: 45)
                                .foregroundColor(Color.color2)
                                .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                                .offset(y: -40)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 18)
                                        .stroke(Color.black, lineWidth: 2)
                                        .offset(y: -40)
                                )
                                
                                .padding()
                            
                            
                                
                                        
                                   
                                .padding()
                        }
                        .padding()
                    }
                }
            }
            
            
}

#Preview {
    babynames()
}
 
