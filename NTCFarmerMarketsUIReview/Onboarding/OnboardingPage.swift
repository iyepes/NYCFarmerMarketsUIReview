import Foundation

/// Content for one onboarding screen.
struct OnboardingPage: Identifiable {
    let id: Int
    let eyebrow: String      // small label above the title
    let emoji: String        // Halloween accent shown with the symbol
    let symbol: String       // SF Symbol
    var heroImage: String? = nil   // asset name; replaces the symbol circle when set
    let title: String
    let message: String
    let bullets: [String]

    static let all: [OnboardingPage] = [
        OnboardingPage(
            id: 0,
            eyebrow: "THE HAUNTING",
            emoji: "🦇",
            symbol: "shippingbox.fill",
            heroImage: "AppLogo",
            title: "Your dinner has traveled farther than you have",
            message: "Big cities lean on big stores, and much of that food crosses a whole coast or an ocean before it reaches you. Meanwhile, small farms and family food makers lurk just around the corner, with no way to reach you.",
            bullets: [
                "Your groceries rack up frequent-flyer miles",
                "Local growers are locked out of the big channels",
                "Neighbors never meet the people who feed them"
            ]
        ),
        OnboardingPage(
            id: 1,
            eyebrow: "THE SPELL",
            emoji: "🎃",
            symbol: "map.fill",
            title: "We conjured up your nearest market",
            message: "New York City quietly publishes Open Data about its farmers markets, a secret scroll that few people ever read. Spooky Markets turns it into a map, so the closest market is one tap away.",
            bullets: [
                "Market locations straight from NYC Open Data",
                "Find markets lurking near you",
                "A friendly new way for local producers to be found"
            ]
        ),
        OnboardingPage(
            id: 2,
            eyebrow: "THE GUEST LIST",
            emoji: "👻",
            symbol: "person.2.fill",
            title: "Neighbors and growers, come on in",
            message: "Hungry for fresher food close to home? Or do you grow and make it yourself? Spooky Markets brings you together, no scary middlemen required.",
            bullets: [
                "New Yorkers who crave fresh, local food",
                "Farmers and family food businesses",
                "Anyone curious what their city has been hiding"
            ]
        )
    ]
}
