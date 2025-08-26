import SwiftUI

struct PrimaryButton: View {
    let title: String
    let icon: String?
    let action: () -> Void
    let style: ButtonStyleType
    let isEnabled: Bool
    
    init(
        title: String,
        icon: String? = nil,
        style: ButtonStyleType = .primary,
        isEnabled: Bool = true,
        action: @escaping () -> Void
    ) {
        self.title = title
        self.icon = icon
        self.style = style
        self.isEnabled = isEnabled
        self.action = action
    }
    
    var body: some View {
        Button(action: {
            if isEnabled {
                action()
            }
        }) {
            HStack(spacing: 8) {
                if let icon = icon {
                    Image(systemName: icon)
                        .font(.system(size: 20, weight: .medium))
                }
                
                Text(title)
                    .font(.h4)
            }
            .foregroundColor(isEnabled ? style.textColor : Color.text2)
            .frame(maxWidth: .infinity)
            .frame(height: 48)
            .background(isEnabled ? style.backgroundColor : Color.grey300)
            .cornerRadius(100) // Fully rounded edges
            .overlay(
                RoundedRectangle(cornerRadius: 100)
                    .stroke(isEnabled ? style.borderColor : Color.clear, lineWidth: style.borderWidth)
            )
        }
        .buttonStyle(PlainButtonStyle())
        .disabled(!isEnabled)
    }
}

// Create a separate SecondaryButton for clarity
struct SecondaryButton: View {
    let title: String
    let icon: String?
    let action: () -> Void
    
    init(
        title: String,
        icon: String? = nil,
        action: @escaping () -> Void
    ) {
        self.title = title
        self.icon = icon
        self.action = action
    }
    
    var body: some View {
        Button(action: action) {
            HStack(spacing: 8) {
                if let icon = icon {
                    Image(systemName: icon)
                        .font(.system(size: 20, weight: .medium))
                }
                
                Text(title)
                    .font(.h4)
            }
            .foregroundColor(.brandPrimary)
            .frame(maxWidth: .infinity)
            .frame(height: 48)
            .background(Color.white)
            .cornerRadius(100) // Fully rounded edges
            .overlay(
                RoundedRectangle(cornerRadius: 100)
                    .stroke(Color.brandPrimary, lineWidth: 2)
            )
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
    
    var borderColor: Color {
        switch self {
        case .primary: return .clear
        case .secondary: return .brandPrimary
        case .small: return .clear
        }
    }
    
    var borderWidth: CGFloat {
        switch self {
        case .primary: return 0
        case .secondary: return 2
        case .small: return 0
        }
    }
}

#Preview {
    VStack(spacing: 20) {
        PrimaryButton(
            title: "Take photo",
            icon: "camera"
        ) {
            print("Take photo tapped")
        }
        
        PrimaryButton(
            title: "Next",
            isEnabled: false
        ) {
            print("Next tapped")
        }
        
        SecondaryButton(
            title: "Choose photo",
            icon: "photo"
        ) {
            print("Choose photo tapped")
        }
        
        PrimaryButton(
            title: "Add pet",
            icon: "plus",
            style: .small
        ) {
            print("Add pet tapped")
        }
    }
    .padding()
}