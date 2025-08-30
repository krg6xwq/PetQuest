import SwiftUI

// MARK: - Typography System
extension Font {
    // MARK: Font Definitions
    static let h1 = Font.custom("Fredoka-Bold", size: 32)
    static let h2 = Font.custom("Fredoka-SemiBold", size: 24)
    static let h3 = Font.custom("Fredoka-SemiBold", size: 20)
    static let h4 = Font.custom("Fredoka-Medium", size: 18)
    static let h5 = Font.custom("Fredoka-Medium", size: 16)
    static let h6 = Font.custom("Fredoka-Medium", size: 14)
    static let body1 = Font.custom("Quicksand-Regular", size: 16)
    static let body2 = Font.custom("Quicksand-Regular", size: 14)
    static let caption = Font.custom("Quicksand-Medium", size: 12)
}

// MARK: - Text Style Modifiers
struct TextStyles {
    struct H1: ViewModifier {
        func body(content: Content) -> some View {
            content
                .font(.h1)
                .foregroundColor(.text1)
        }
    }
    
    struct H4: ViewModifier {
        func body(content: Content) -> some View {
            content
                .font(.h4)
                .foregroundColor(.text1)
        }
    }
    
    struct H5: ViewModifier {
        func body(content: Content) -> some View {
            content
                .font(.h5)
                .foregroundColor(.text1)
        }
    }
    
    struct Body1: ViewModifier {
        func body(content: Content) -> some View {
            content
                .font(.body1)
                .foregroundColor(.text1)
        }
    }
    
    struct Body2: ViewModifier {
        func body(content: Content) -> some View {
            content
                .font(.body2)
                .foregroundColor(.text2)
        }
    }
    
    struct Caption: ViewModifier {
        func body(content: Content) -> some View {
            content
                .font(.caption)
                .foregroundColor(.text2)
        }
    }
}

// MARK: - View Extension
extension View {
    func textStyle<Style: ViewModifier>(_ style: Style) -> some View {
        self.modifier(style)
    }
}