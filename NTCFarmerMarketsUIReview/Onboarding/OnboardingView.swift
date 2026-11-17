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

            VStack(spacing: 0) {
                HStack {
                    Spacer()
                    Button("Skip") { finish() }
                        .foregroundStyle(Color.smSurface)
                        .opacity(isLast ? 0 : 1)
                        .disabled(isLast)
                }
                .padding(.horizontal, 24)
                .padding(.top, 8)
                .frame(height: 44)

                TabView(selection: $selection) {
                    ForEach(pages) { page in
                        OnboardingPageView(page: page).tag(page.id)
                    }
                }
                .tabViewStyle(.page(indexDisplayMode: .always))
                .indexViewStyle(.page(backgroundDisplayMode: .never))

                Button(action: advance) {
                    Text(isLast ? "Enter the market" : "Next")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 16)
                        .background(Color.smSecondary, in: Capsule())
                        // Deep-on-orange keeps contrast readable; white on this orange is weak.
                        .foregroundStyle(Color.smDeep)
                }
                .padding(.horizontal, 24)
                .padding(.bottom, 24)
            }
        }
        .preferredColorScheme(.dark)
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
