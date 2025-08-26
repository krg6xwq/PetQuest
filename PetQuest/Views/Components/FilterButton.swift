import SwiftUI

struct FilterButton: View {
    let action: () -> Void
    
    init(action: @escaping () -> Void = {}) {
        self.action = action
    }
    
    var body: some View {
        Button(action: action) {
            Image(systemName: "slider.horizontal.3")
                .font(.system(size: 16))
                .foregroundColor(Color.brandPrimary)
                .frame(width: 48, height: 48)
                .background(Color.white)
                .cornerRadius(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.borderPrimary, lineWidth: 1)
                )
        }
        .buttonStyle(PlainButtonStyle())
    }
}

#Preview {
    HStack(spacing: 16) {
        FilterButton()
        
        FilterButton {
            print("Filter tapped")
        }
    }
    .padding()
    .background(Color.bgTertiary)
}