import SwiftUI

@main
struct SpookyMarketsApp: App {
    @AppStorage("hasSeenOnboarding") private var hasSeenOnboarding = false

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
