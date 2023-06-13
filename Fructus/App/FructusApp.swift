//
//  FructusApp.swift
//  Fructus
//
//  Created by Leonardo Lazzari on 17/04/23.
//

import SwiftUI

// @main Define entry point of execution of the app
@main
struct FructusApp: App {
    // MARK: - PROPERTIES
    @AppStorage("isOnboarding") var isOnboarding = true
    
    var body: some Scene {
        WindowGroup {
            if isOnboarding {
                OnboardingView()
            } else {
                ContentView()
            }
        }
    }
}
