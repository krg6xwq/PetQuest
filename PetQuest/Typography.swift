import SwiftUI

// MARK: - Custom Fonts
extension Font {
    // MARK: Fredoka Medium (Headings)
    static func fredokaMedium(size: CGFloat) -> Font {
        return .custom("Fredoka-Medium", size: size)
    }
    
    // MARK: Quicksand Regular (Body & Caption)
    static func quicksandRegular(size: CGFloat) -> Font {
        return .custom("Quicksand-Regular", size: size)
    }
}

// MARK: - Text Styles
extension Font {
    // MARK: Heading Styles (Fredoka Medium)
    static let h1 = Font.fredokaBold(size: 32)
    static let h2 = Font.fredokaSemibold(size: 24)
    static let h3 = Font.fredokaSemibold(size: 20)
    static let h4 = Font.fredokaMedium(size: 18)
    static let h5 = Font.fredokaMedium(size: 16)
    static let h6 = Font.fredokaMedium(size: 14)
    
    // MARK: Body Styles (Quicksand Regular)
    static let body1 = Font.quicksandRegular(size: 16)
    static let body2 = Font.quicksandRegular(size: 14)
    
    // MARK: Caption Style (Quicksand Regular)
    static let caption = Font.quicksandMedium(size: 12)
}

// MARK: - Typography View Extensions
extension View {
    // MARK: Heading Modifiers
    func h1Style() -> some View {
        self.font(.h1)
    }
    
    func h2Style() -> some View {
        self.font(.h2)
    }
    
    func h3Style() -> some View {
        self.font(.h3)
    }
    
    func h4Style() -> some View {
        self.font(.h4)
    }
    
    func h5Style() -> some View {
        self.font(.h5)
    }
    
    func h6Style() -> some View {
        self.font(.h6)
    }
    
    // MARK: Body Modifiers
    func body1Style() -> some View {
        self.font(.body1)
    }
    
    func body2Style() -> some View {
        self.font(.body2)
    }
    
    // MARK: Caption Modifier
    func captionStyle() -> some View {
        self.font(.caption)
    }
}

// MARK: - Text Style Structs for Reusability
struct TextStyles {
    // MARK: Heading Styles
    struct H1: ViewModifier {
        func body(content: Content) -> some View {
            content
                .font(.h1)
                .foregroundColor(.text1)
        }
    }
    
    struct H2: ViewModifier {
        func body(content: Content) -> some View {
            content
                .font(.h2)
                .foregroundColor(.text1)
        }
    }
    
    struct H3: ViewModifier {
        func body(content: Content) -> some View {
            content
                .font(.h3)
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
    
    struct H6: ViewModifier {
        func body(content: Content) -> some View {
            content
                .font(.h6)
                .foregroundColor(.text1)
        }
    }
    
    // MARK: Body Styles
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
    
    // MARK: Caption Style
    struct Caption: ViewModifier {
        func body(content: Content) -> some View {
            content
                .font(.caption)
                .foregroundColor(.text2)
        }
    }
}

// MARK: - Convenient View Extensions
extension View {
    func textStyle<Style: ViewModifier>(_ style: Style) -> some View {
        self.modifier(style)
    }
}