//
//  OnboardingIntroView.swift
//  rounded2
//
//  Created by Renad alkhathami on 11/03/1446 AH.
//

import SwiftUI

struct OnboardingIntroView: View {
    @AppStorage("hasSeenOnboarding") private var hasSeenOnboarding = false

    var body: some View {
        NavigationView {
            ZStack {
                // Customizable Onboarding Image
                Image("onb")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 350, height: 500) // Custom width and height
                    .offset(x: -9, y: -10) // Custom x and y position
                    .clipped() // Ensures no overflow
                    .edgesIgnoringSafeArea(.all)
                
                // Add Text with offset positioning
                Text("Welcome to rawaf")
                    .font(.largeTitle)
                    .fontWeight(.light)
                    .foregroundColor(.black) // Customizable text color
                    .offset(x: -2, y: 80)
                // Adjust x and y for text position
                Text(" manage your baby's daily tasks with ease.")
                    .font(.title2)
                    .fontWeight(.light)
                    .foregroundColor(.black) // Customizable text color
                    .multilineTextAlignment(.center)
                    .offset(x: -2, y: 160)
                // Navigation Arrow at the Bottom Right
                VStack {
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
                        .padding(.bottom, 20)
                        .padding(.trailing, 50)
                        .offset(x: -250, y: -60)
                        .simultaneousGesture(TapGesture().onEnded {
                            hasSeenOnboarding = true // Set flag to true when onboarding is completed
                        })
                    }
                }
            }
            .navigationBarHidden(true) // Hides the navigation bar
        }
    }
}

#Preview {
    OnboardingIntroView()
}
