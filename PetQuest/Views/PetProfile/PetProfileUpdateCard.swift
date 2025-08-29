import SwiftUI

struct PetProfileUpdateCard: View {
    let update: PetUpdate
    
    var body: some View {
        NavigationLink(destination: ViewUpdateView(update: update)) {
            VStack(spacing: 8) {
                // Image
                if let image = update.image {
                    Image(uiImage: image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 160)
                        .clipped()
                        .cornerRadius(4, corners: [.topLeft, .topRight])
                } else {
                    Image("dog-walk")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 160)
                        .clipped()
                        .cornerRadius(4, corners: [.topLeft, .topRight])
                }
                
                VStack(alignment: .leading, spacing: 8) {
                    // Date
                    Text(update.timestamp)
                        .font(.h5)
                        .foregroundColor(Color.text1)
                    
                    // Tags
                    HStack(spacing: 4) {
                        ForEach(update.tags, id: \.self) { tag in
                            UpdateTag(text: tag)
                        }
                        Spacer()
                    }
                    
                    // Description
                    Text(update.description)
                        .font(.body2)
                        .foregroundColor(Color.text1)
                        .lineLimit(3)
                        .multilineTextAlignment(.leading)
                }
                .padding(8)
            }
            .background(Color.bgTertiary)
            .cornerRadius(8)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.borderPrimary, lineWidth: 1)
            )
        }
        .buttonStyle(PlainButtonStyle())
    }
}

// Extension for corner radius on specific corners
extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}

#Preview {
    HStack(spacing: 12) {
        PetProfileUpdateCard(update: PetUpdate(
            petName: "Roxie",
            petBreed: "Jindo",
            timestamp: "24 Jul 2025 - 5:31pm",
            image: nil,
            tags: ["Walk 🦮", "Happy 😁"],
            xpGained: 25,
            description: "Luna went for a walk and played with the other dogs and jumped into the pool. Luna went for a walk and played with the other dogs..."
        ))
        .frame(width: 200)
        
        PetProfileUpdateCard(update: PetUpdate(
            petName: "Bailey",
            petBreed: "Bordoodle",
            timestamp: "23 Jul 2025 - 2:15pm",
            image: nil,
            tags: ["Training 🎾", "Good 👍"],
            xpGained: 15,
            description: "Bailey learned a new trick today! Successfully mastered 'roll over' after practicing for 30 minutes. Very proud of the progress..."
        ))
        .frame(width: 200)
    }
    .padding()
}