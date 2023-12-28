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
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Riminder.self)
        }
    }
}
