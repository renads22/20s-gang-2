//
//  logoview.swift
//  rounded2
//
//  Created by Renad alkhathami on 11/03/1446 AH.
//

import SwiftUI
extension UserDefaults {
    
    var welcomeScreenShown: Bool {
        get {
            return (UserDefaults.standard.value(forKey: "welcomeScreenShown") as? Bool) ?? false
        }
        set {
            UserDefaults.standard.setValue(newValue, forKey: "welcomeScreenShown")
        }
    }
    
}


struct LogoView: View {
    @State private var showLogo = true
    @State private var navigateToOnboarding = false
    @State var isActive : Bool = false
    
    var body: some View {
        NavigationView {
            ZStack {
                if isActive {
                    if UserDefaults.standard.welcomeScreenShown{
                        ContentView()
                    }
                    else{
                        OnboardingIntroView() // Your onboarding view
                    }
    
                } else {
                    VStack {
                        if showLogo {
                            Image("logo")
                                .resizable()
                                .scaledToFit() // Ensures aspect ratio is preserved
                                .frame(width: 340, height: 450)
                                .padding() // Adds some padding around the image
                                .onAppear {
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                                        withAnimation {
                                            showLogo = false
                                            self.isActive = true 
                                        }
                                    }
                                }
                        }
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.backColore) // Set a background color if needed
                    .edgesIgnoringSafeArea(.all) // Ensures the content fills the screen
                }
            }
            //.navigationBarHidden(true) // Hide navigation bar to show the full logo
        }
    }
}

#Preview {
    LogoView()
}
