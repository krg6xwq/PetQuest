import SwiftUI

struct UpdateTag: View {
    let text: String
    
    var body: some View {
        Text(text)
            .font(.caption)
            .foregroundColor(Color.text2)
            .padding(.horizontal, 8)
            .padding(.vertical, 2)
            .background(Color.white)
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.borderPrimary, lineWidth: 1)
            )
    }
}

struct UpdateTagLarge: View {
    let text: String
    
    var body: some View {
        Text(text)
            .font(.body1)
            .foregroundColor(Color.text2)
            .padding(.horizontal, 12)
            .padding(.vertical, 4)
            .background(Color.white)
            .cornerRadius(20)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.borderPrimary, lineWidth: 1)
            )
    }
}

#Preview {
    VStack(spacing: 12) {
        HStack(spacing: 8) {
            UpdateTag(text: "Walk 🐕")
            UpdateTag(text: "Happy 😊")
            UpdateTag(text: "Play 🎾")
        }
        
        HStack(spacing: 8) {
            UpdateTagLarge(text: "Walk 🐕")
            UpdateTagLarge(text: "Happy 😊")
        }
    }
    .padding()
}