import SwiftUI

struct OnboardingView: View {
    @AppStorage("hasSeenOnboarding") private var hasSeenOnboarding = false
    @State private var selection = 0

    private let pages = OnboardingPage.all
    private var isLast: Bool { selection == pages.count - 1 }

    var body: some View {
        ZStack {
            LinearGradient(
                colors: [Color.smDeep, Color.smDeep.opacity(0.85)],
                startPoint: .top, endPoint: .bottom
            )
            .ignoresSafeArea()

            // Pages use the full height. Content scrolls underneath the glass controls.
            TabView(selection: $selection) {
                ForEach(pages) { page in
                    OnboardingPageView(page: page).tag(page.id)
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            .ignoresSafeArea(edges: .bottom)
        }
        .overlay(alignment: .topTrailing) { skipButton }
        .overlay(alignment: .bottom) { bottomControls }
        .preferredColorScheme(.dark)
    }

    private var skipButton: some View {
        Button("Skip") { finish() }
            .appFont(.body)
            .buttonStyle(.glass)
            .foregroundStyle(Color.smSurface)
            .padding(.horizontal, 24)
            .opacity(isLast ? 0 : 1)
            .disabled(isLast)
    }

    private var bottomControls: some View {
        VStack(spacing: 16) {
            HStack(spacing: 8) {
                ForEach(pages) { page in
                    Circle()
                        .fill(page.id == selection ? Color.smHighlight : Color.white.opacity(0.4))
                        .frame(width: 8, height: 8)
                }
            }
            .padding(.horizontal, 14)
            .padding(.vertical, 10)
            .glassEffect(.regular, in: .capsule)
            .accessibilityElement(children: .ignore)
            .accessibilityLabel("Page \(selection + 1) of \(pages.count)")

            Button(action: advance) {
                Text(isLast ? "Enter the market" : "Next")
                    .appFont(.bodyEmphasis)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 8)
                    // Deep-on-orange keeps contrast readable; white on this orange is weak.
                    .foregroundStyle(Color.smDeep)
            }
            .buttonStyle(.glassProminent)
            .tint(Color.smSecondary)
            .controlSize(.large)
        }
        .padding(.horizontal, 24)
        .padding(.bottom, 8)
    }

    private func advance() {
        if isLast {
            finish()
        } else {
            withAnimation(.easeInOut) { selection += 1 }
        }
    }

    private func finish() {
        hasSeenOnboarding = true
    }
}

#Preview {
    OnboardingView()
}
