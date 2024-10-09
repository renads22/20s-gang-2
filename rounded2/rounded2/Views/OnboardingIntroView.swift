//
//  OnboardingIntroView.swift
//  rounded2
//
//  Created by Renad alkhathami on 11/03/1446 AH.
//

import SwiftUI

struct OnboardingIntroView: View {
   // @AppStorage("hasSeenOnboarding") private var hasSeenOnboarding = false

    var body: some View {
        NavigationView {
            VStack {
                // Customizable Onboarding Image
                Image("onboarding1")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 250, height: 250) // Custom width and height
                   // .offset(x: -9, y: -10) // Custom x and y position
                    .clipped() // Ensures no overflow
                   // .edgesIgnoringSafeArea(.all)
                   // .padding(85)
                    .padding(.top, 130)
                // Add Text with offset positioning
                Text("Welcome to rawaf")
                    .font(.largeTitle)
                    .fontWeight(.light)
                    .foregroundColor(.black) // Customizable text color
                    //.offset(x: -2, y: 80)
                // Adjust x and y for text position
                    .padding(.top, 45)
                Text(" manage your baby's daily tasks with ease.")
                    .font(.title2)
                    .fontWeight(.light)
                    .foregroundColor(.black) // Customizable text color
                    .multilineTextAlignment(.center)
                    //.offset(x: -2, y: 160)
                // Navigation Arrow at the Bottom Right
                
                    Spacer()
                    HStack {
                        Spacer()
                        NavigationLink(destination: OnboardingFinalView()) {
                            Image(systemName: "arrow.right.circle.fill")
                                .resizable()
                                .foregroundColor(.yellow.opacity(1))
                                .frame(width: 50, height: 50)
                        }
                        .frame(width: 50, height: 50) // Set NavigationLink's tappable area to match the image size
                        .padding(.bottom, 55)
                        .padding(.trailing, 300)
                       // .offset(x: -250, y: -60)
//                        .simultaneousGesture(TapGesture().onEnded {
//                            hasSeenOnboarding = true // Set flag to true when onboarding is completed
//                        })
                    }
                
            }
            //.navigationBarHidden(true) // Hides the navigation bar
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
        
        .onAppear(perform: {
            UserDefaults.standard.welcomeScreenShown = true
        })
        
    }
}

#Preview {
    OnboardingIntroView()
}
