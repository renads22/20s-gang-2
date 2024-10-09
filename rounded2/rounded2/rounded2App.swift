//
//  rounded2App.swift
//  rounded2
//
//  Created by Renad alkhathami on 07/06/1445 AH.
//

import SwiftUI
import SwiftData

@main
struct rounded2App: App {
    //@AppStorage("hasSeenOnboarding") private var hasSeenOnboarding = false

    var body: some Scene {
        WindowGroup {
//            if hasSeenOnboarding {
//                ContentView() // Main content after onboarding
//            } else {
//                LogoView() // The logo page that navigates to onboarding
//                    .onAppear {
//                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
//                            hasSeenOnboarding = true // Mark onboarding as seen after it appears once
//                        }
//                    }
//            }
            LogoView()
        }
        .modelContainer(for: Riminder.self)
    }
}
