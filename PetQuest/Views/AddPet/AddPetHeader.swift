import SwiftUI

struct AddPetHeader: View {
    let onBackTap: () -> Void
    
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
            
            Spacer()
            
            Text("Add new pet")
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
    AddPetHeader {
        print("Back tapped")
    }
}