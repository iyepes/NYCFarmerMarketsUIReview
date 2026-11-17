import SwiftUI

/// Spooky Markets palette. If you already have this enum, keep yours and
/// only add the `Color(hex:)` extension below.
enum Palette {
    static let primary = 0xAC84D6      // lavender
    static let secondary = 0xC56B23    // pumpkin orange
    static let deep = 0x31078C         // midnight purple
    static let highlight = 0xCA881E    // candlelight gold
    static let surface = 0xCBC7D9      // mist
    static let appIconOlive = 0xC56B23
}

extension Color {
    init(hex: Int, opacity: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xFF) / 255,
            green: Double((hex >> 8) & 0xFF) / 255,
            blue: Double(hex & 0xFF) / 255,
            opacity: opacity
        )
    }

    static let smPrimary = Color(hex: Palette.primary)
    static let smSecondary = Color(hex: Palette.secondary)
    static let smDeep = Color(hex: Palette.deep)
    static let smHighlight = Color(hex: Palette.highlight)
    static let smSurface = Color(hex: Palette.surface)
}
