//
//  names2.swift
//  rounded2
//
//  Created by Renad alkhathami on 12/06/1445 AH.
//

import SwiftUI

struct names2: View {
    @State private  var name:String=""
    @State private  var age:String=""
    var body: some View {
        VStack {
            HStack {
                                Spacer()
                                Text("اسم الطفل")
                                    .font(.title)
                            }
                            .multilineTextAlignment(.trailing)
                        TextField("اكتب اسم الطفل", text: $name )
                                        .textFieldStyle(.roundedBorder)
                                        //.padding()
                                        .multilineTextAlignment(.trailing)
                                        .overlay(
                                            
                                    RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.black, lineWidth: 1)// تعيين لون الحدود بالأسود
                                                        )
            
            
            HStack {
                                Spacer()
                                Text("عمر الطفل")
                                    .font(.title)
                            }
                            .multilineTextAlignment(.trailing)
                        TextField("اكتب عمر الطفل", text: $age )
                                        .textFieldStyle(.roundedBorder)
                                        //.padding()
                                        .multilineTextAlignment(.trailing)
                                        .overlay(
                                            
                                    RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.black, lineWidth: 1)// تعيين لون الحدود بالأسود
                                                        )
        
            HStack{
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 42, height: 25)
                    .background(Color(red: 0.67, green: 0.8, blue: 0.78))
                    .cornerRadius(5)
                    .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                
                
                Rectangle()
    
                  .foregroundColor(.clear)
                  .frame(width: 42, height: 25)
                  .background(Color(red: 0.67, green: 0.8, blue: 0.78))
                  .cornerRadius(5)
                  .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                
            }
            
        }
    }
}

#Preview {
    names2()
}
