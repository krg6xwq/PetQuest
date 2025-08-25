import SwiftUI

struct PrimaryButton: View {
    let title: String
    let icon: String?
    let action: () -> Void
    let style: ButtonStyleType
    
    init(
        title: String,
        icon: String? = nil,
        style: ButtonStyleType = .primary,
        action: @escaping () -> Void
    ) {
        self.title = title
        self.icon = icon
        self.style = style
        self.action = action
    }
    
    var body: some View {
        Button(action: action) {
            HStack(spacing: style.iconSpacing) {
                if let icon = icon {
                    Image(systemName: icon)
                        .font(.system(size: style.iconSize, weight: .medium))
                }
                
                Text(title)
                    .font(.custom("Fredoka-Medium", size: style.fontSize))
            }
            .foregroundColor(style.textColor)
            .padding(.horizontal, style.horizontalPadding)
            .padding(.vertical, style.verticalPadding)
            .background(style.backgroundColor)
            .cornerRadius(style.cornerRadius)
        }
        .buttonStyle(PlainButtonStyle())
    }
}

enum ButtonStyleType {
    case primary
    case secondary
    case small
    
    var backgroundColor: Color {
        switch self {
        case .primary: return .brandPrimary
        case .secondary: return .white
        case .small: return .brandPrimary
        }
    }
    
    var textColor: Color {
        switch self {
        case .primary: return .white
        case .secondary: return .brandPrimary
        case .small: return .white
        }
    }
    
    var fontSize: CGFloat {
        switch self {
        case .primary: return 18
        case .secondary: return 16
        case .small: return 18
        }
    }
    
    var horizontalPadding: CGFloat {
        switch self {
        case .primary: return 16
        case .secondary: return 16
        case .small: return 12
        }
    }
    
    var verticalPadding: CGFloat {
        switch self {
        case .primary: return 12
        case .secondary: return 10
        case .small: return 8
        }
    }
    
    var cornerRadius: CGFloat {
        switch self {
        case .primary: return 12
        case .secondary: return 8
        case .small: return 20
        }
    }
    
    var iconSize: CGFloat {
        switch self {
        case .primary: return 18
        case .secondary: return 16
        case .small: return 16
        }
    }
    
    var iconSpacing: CGFloat {
        switch self {
        case .primary: return 8
        case .secondary: return 6
        case .small: return 6
        }
    }
}

#Preview {
    VStack(spacing: 20) {
        PrimaryButton(
            title: "Add pet",
            icon: "plus",
            style: .small
        ) {
            print("Add pet tapped")
        }
        
        PrimaryButton(
            title: "Primary Button",
            style: .primary
        ) {
            print("Primary button tapped")
        }
        
        PrimaryButton(
            title: "Secondary",
            icon: "heart",
            style: .secondary
        ) {
            print("Secondary button tapped")
        }
    }
    .padding()
}