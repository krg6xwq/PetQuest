import SwiftUI

struct NavigationHeader: View {
    let title: String
    let onBackTap: () -> Void
    
    init(title: String = "Add new pet", onBackTap: @escaping () -> Void) {
        self.title = title
        self.onBackTap = onBackTap
    }
    
    var body: some View {
        HStack {
            Button(action: onBackTap) {
                HStack(spacing: 8) {
                    Image(systemName: "chevron.left")
                        .font(.system(size: 16, weight: .medium))
                        .foregroundColor(Color.text2)
                    
                    Text("Back")
                        .font(.h4)
                        .foregroundColor(Color.text2)
                }
            }
            .buttonStyle(PlainButtonStyle())
            
            Spacer()
            
            Text(title)
                .font(.h4)
                .foregroundColor(Color.text2)
            
            Spacer()
            
            // Empty space for alignment (matches Figma design)
            Rectangle()
                .fill(Color.clear)
                .frame(width: 64, height: 22)
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 16)
    }
}

#Preview {
    VStack(spacing: 20) {
        NavigationHeader(title: "Add new pet") {
            print("Back tapped")
        }
        
        NavigationHeader(title: "Pet profile") {
            print("Back tapped")
        }
        
        NavigationHeader(title: "Settings") {
            print("Back tapped")
        }
    }
    .background(Color.bgTertiary)
}