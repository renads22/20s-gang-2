//
//  Najlaa.swift
//  rounded2
//
//  Created by Renad alkhathami on 12/06/1445 AH.
//
import SwiftUI

struct NajlaaView: View {
    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    // Your main content view goes here
                    Text("مرحبا بك في تطبيق رواف نحن هنا لمساعدتك بالعناية بطفلك")
                        .font(.title)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.brown)
                        .padding()
                    
                    NavigationLink(destination: names2()) {
                        Text("Go to names page")
                            .font(.headline)
                            .foregroundColor(.blue)
                            .padding()
                    }
                }
                
                Image("Hi")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.black)
                    .padding(.all, 20)
            }
            .navigationTitle("Home")
        }
    }
}



#Preview {
    NajlaaView()
}
