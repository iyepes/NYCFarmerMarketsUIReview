//
//  NTCFarmerMarketsUIReviewApp.swift
//  NTCFarmerMarketsUIReview
//
//  Created by Isabel Yepes on 16/11/26.
//

import SwiftUI

@main
struct NTCFarmerMarketsUIReviewApp: App {
    @AppStorage("hasSeenOnboarding") private var hasSeenOnboarding = false

    init() {
        AppTypography.registerFonts()
    }

    var body: some Scene {
        WindowGroup {
            if hasSeenOnboarding {
                // Replace with your real home/map screen.
                Text("Home")
            } else {
                OnboardingView()
            }
        }
    }
}
