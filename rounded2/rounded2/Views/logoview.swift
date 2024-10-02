//
//  logoview.swift
//  rounded2
//
//  Created by Renad alkhathami on 11/03/1446 AH.
//

import SwiftUI

struct LogoView: View {
    @State private var showLogo = true
    @State private var navigateToOnboarding = false
    
    var body: some View {
        NavigationView {
            ZStack {
                if navigateToOnboarding {
                    OnboardingIntroView() // Your onboarding view
                } else {
                    VStack {
                        if showLogo {
                            Image("logo")
                                .resizable()
                                .scaledToFit() // Ensures aspect ratio is preserved
                                .frame(width: 600, height: 550)
                                .padding() // Adds some padding around the image
                                .onAppear {
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                                        withAnimation {
                                            showLogo = false
                                            navigateToOnboarding = true
                                        }
                                    }
                                }
                        }
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.white) // Set a background color if needed
                    .edgesIgnoringSafeArea(.all) // Ensures the content fills the screen
                }
            }
            .navigationBarHidden(true) // Hide navigation bar to show the full logo
        }
    }
}

#Preview {
    LogoView()
}
