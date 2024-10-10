//
//  OnboardingFinalView.swift
//  rounded2
//
//  Created by Renad alkhathami on 11/03/1446 AH.
//

import SwiftUI

struct OnboardingFinalView: View {
    //@AppStorage("hasSeenOnboarding") private var hasSeenOnboarding = false
   // @Environment(\.presentationMode) var presentationMode
    var body: some View {
        GeometryReader { geometry in
            VStack {
                // Fullscreen Onboarding Image
                Image("onboarding2")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 250, height: 250) // Custom width and height
                    //.offset(x: 1, y: -10) // Custom x and y position
                    .clipped() // Ensures no overflow
                    //.edgesIgnoringSafeArea(.all)
                    .padding(.top,170)
                Text("Reminder System")
                    .font(.largeTitle)
                    .fontWeight(.light)
                    .foregroundColor(.black) // Customizable text color
                    //.offset(x: 8, y: 70)
                    .padding(.top,90)
                Text(" set reminders for feeding, sleeping, and more, so you can stay informed about your baby's schedule . ")
                    .font(.title2)
                    .fontWeight(.light)
                    .foregroundColor(.black) // Customizable text color
                    .multilineTextAlignment(.center)
                   // .offset(x: 5, y: 160) // Adjust x and y for text position
                
                // Button Overlay on Top of the Image
                
                    Spacer()
                    
                    NavigationLink(destination: ContentView()) {
                        Text("Start")
                            .foregroundColor(.white)
                            .font(.headline)
                            .padding(.horizontal, 40)
                            .padding(.vertical, 15)
                            .background(Color.yellow .opacity(1))
                            .cornerRadius(10)
                            .padding(.bottom,55)
                           // .offset(x: 1, y: -2)
                    }
                    .padding(.bottom, 65) // Adjusts the position of the button
//                    .simultaneousGesture(TapGesture().onEnded {
//                        hasSeenOnboarding = true // Set flag to true when onboarding is completed
//                    })
                
            }
        }
        .edgesIgnoringSafeArea(.all) // Ensures the GeometryReader's ZStack takes the full screen
        //.navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .background(
            Image("background2")
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
    OnboardingFinalView()
}
