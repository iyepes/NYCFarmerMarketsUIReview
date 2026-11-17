import SwiftUI

struct OnboardingPageView: View {
    let page: OnboardingPage

    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                hero
                    .padding(.top, 32)

                Text(page.eyebrow)
                    .font(.caption.weight(.bold))
                    .tracking(2)
                    .foregroundStyle(Color.smHighlight)

                Text(page.title)
                    .font(.system(.largeTitle, design: .serif).weight(.bold))
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.white)

                Text(page.message)
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(Color.smSurface)

                VStack(alignment: .leading, spacing: 12) {
                    ForEach(page.bullets, id: \.self) { bullet in
                        HStack(alignment: .top, spacing: 12) {
                            Image(systemName: "moon.stars.fill")
                                .foregroundStyle(Color.smHighlight)
                                .accessibilityHidden(true)
                            Text(bullet)
                                .foregroundStyle(.white)
                        }
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(16)
                .background(Color.white.opacity(0.08), in: RoundedRectangle(cornerRadius: 16))
            }
            .padding(.horizontal, 24)
            .padding(.bottom, 24)
        }
        .scrollBounceBehavior(.basedOnSize)
    }

    private var hero: some View {
        ZStack(alignment: .topTrailing) {
            Circle()
                .fill(
                    RadialGradient(
                        colors: [Color.smPrimary, Color.smPrimary.opacity(0.15)],
                        center: .center, startRadius: 10, endRadius: 100
                    )
                )
                .frame(width: 180, height: 180)
                .overlay {
                    Image(systemName: page.symbol)
                        .font(.system(size: 72))
                        .foregroundStyle(Color.smDeep)
                }

            Text(page.emoji)
                .font(.system(size: 44))
        }
        .accessibilityHidden(true)
    }
}

#Preview {
    ZStack {
        Color.smDeep.ignoresSafeArea()
        OnboardingPageView(page: OnboardingPage.all[0])
    }
}
