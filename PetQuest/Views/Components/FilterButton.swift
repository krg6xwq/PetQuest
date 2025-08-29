import SwiftUI

struct FilterButton: View {
    let action: () -> Void
    let activeFilterCount: Int
    
    init(activeFilterCount: Int = 0, action: @escaping () -> Void = {}) {
        self.activeFilterCount = activeFilterCount
        self.action = action
    }
    
    var body: some View {
        Button(action: action) {
            ZStack {
                Image(systemName: "slider.horizontal.3")
                    .font(.system(size: 24))
                    .foregroundColor(Color.brandPrimary)
                    .frame(width: 48, height: 48)
                    .background(Color.white)
                    .cornerRadius(8)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.borderPrimary, lineWidth: 1)
                    )
                
                if activeFilterCount > 0 {
                    ZStack {
                        Circle()
                            .fill(Color.coralRed)
                            .frame(width: 18, height: 18)
                        
                        Text("\(activeFilterCount)")
                            .font(.system(size: 11, weight: .bold))
                            .foregroundColor(.white)
                    }
                    .offset(x: 14, y: 14)
                }
            }
            .frame(width: 48, height: 48)
            .clipped()
        }
        .buttonStyle(PlainButtonStyle())
    }
}

#Preview {
    HStack(spacing: 16) {
        FilterButton()
        
        FilterButton(activeFilterCount: 2) {
            print("Filter tapped")
        }
        
        FilterButton(activeFilterCount: 5) {
            print("Filter tapped")
        }
    }
    .padding()
    .background(Color.bgTertiary)
}