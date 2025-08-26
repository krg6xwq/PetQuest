import SwiftUI

extension Color {
    // MARK: - Palette Colors
    static let coralRed = Color(red: 1.0, green: 0.369, blue: 0.376)
    static let tangerineOrange = Color(red: 1.0, green: 0.369, blue: 0.235)
    static let sunflowerYellow = Color(red: 1.0, green: 0.851, blue: 0.239)
    static let forestGreen = Color(red: 0.416, green: 0.596, blue: 0.306)
    static let leafGreen = Color(red: 0.220, green: 0.502, blue: 0.000)
    static let mintGreen = Color(red: 0.431, green: 0.906, blue: 0.718)
    static let skyBlue = Color(red: 0.294, green: 0.639, blue: 0.949)
    static let aquaBlue = Color(red: 0.651, green: 0.890, blue: 0.912)
    static let iceBlue = Color(red: 0.878, green: 0.984, blue: 0.988)
    static let lavenderPurple = Color(red: 0.655, green: 0.549, blue: 0.980)
    static let royalPurple = Color(red: 0.353, green: 0.098, blue: 0.604)
    
    // MARK: - Grey Colors
    static let grey800 = Color(red: 0.129, green: 0.129, blue: 0.180)
    static let grey600 = Color(red: 0.420, green: 0.447, blue: 0.502)
    static let grey400 = Color(red: 0.894, green: 0.902, blue: 0.922)
    static let grey300 = Color(red: 0.973, green: 0.973, blue: 0.973)
    static let grey200 = Color(red: 0.980, green: 0.980, blue: 0.980)
    static let grey100 = Color(red: 1.0, green: 1.0, blue: 1.0)
}

// MARK: - Color Hex Convenience
extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }
        
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}

// MARK: - Semantic Colors

// MARK: Text Colors
extension Color {
    static let textPrimary = skyBlue
    static let text1 = grey800
    static let text2 = grey600
    static let textInactive = grey300
}

// MARK: Background Colors
extension Color {
    static let bgPrimary = skyBlue
    static let bgSecondary = grey100
    static let bgTertiary = grey200
    static let bgInactive = grey300
}

// MARK: Border Colors
extension Color {
    static let borderPrimary = grey400
}

// MARK: Attribute Colors
extension Color {
    static let attributeSpeed = sunflowerYellow
    static let attributeHP = mintGreen
    static let attributeAttack = coralRed
    static let attributeDefense = lavenderPurple
}

// MARK: Brand Colors
extension Color {
    static let brandPrimary = skyBlue
    static let brandSecondary = grey100
}

// MARK: - Pet Type Colors
extension Color {
    static let petTypeColors: [String: Color] = [
        "fire": .tangerineOrange,
        "water": .skyBlue,
        "earth": .forestGreen,
        "air": .iceBlue,
        "lightning": .sunflowerYellow,
        "frost": .aquaBlue,
        "shadow": .royalPurple,
        "grass": .leafGreen,
    ]
    
    static func petType(_ type: String) -> Color {
        return petTypeColors[type.lowercased()] ?? .grey400
    }
}