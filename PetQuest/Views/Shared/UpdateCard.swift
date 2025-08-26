import SwiftUI

struct UpdateCard: View {
    let update: PetUpdate
    
    var body: some View {
        VStack(spacing: 8) {
            // Header with pet name and timestamp
            HStack {
                Text("\(update.petName) (\(update.petBreed))")
                    .font(.h5)
                    .foregroundColor(Color.brandPrimary)
                
                Spacer()
                
                Text(update.timestamp)
                    .font(.body2)
                    .foregroundColor(Color.text2)
            }
            
            // Update content card
            HStack(alignment: .top, spacing: 12) {
                // Pet Image
                if let image = update.image {
                    Image(uiImage: image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 96, height: 96)
                        .clipped()
                        .cornerRadius(8)
                } else {
                    Rectangle()
                        .fill(Color.grey300)
                        .frame(width: 96, height: 96)
                        .cornerRadius(8)
                        .overlay(
                            Image(systemName: "photo")
                                .font(.system(size: 24))
                                .foregroundColor(.gray)
                        )
                }
                
                // Content
                VStack(alignment: .leading, spacing: 4) {
                    // Tags and XP row
                    HStack {
                        // Tags
                        HStack(spacing: 4) {
                            ForEach(update.tags, id: \.self) { tag in
                                Text(tag)
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
                        
                        Spacer()
                        
                        // XP
                        Text("+\(update.xpGained) XP")
                            .font(.caption)
                            .foregroundColor(Color.brandPrimary)
                    }
                    
                    // Description
                    Text(update.description)
                        .font(.body2)
                        .foregroundColor(Color.text1)
                        .lineLimit(3)
                        .multilineTextAlignment(.leading)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(8)
            .background(Color.bgTertiary)
            .cornerRadius(8)
        }
    }
}

struct PetUpdate: Identifiable {
    let id = UUID()
    let petName: String
    let petBreed: String
    let timestamp: String
    let image: UIImage?
    let tags: [String]
    let xpGained: Int
    let description: String
}

#Preview {
    VStack(spacing: 12) {
        UpdateCard(update: PetUpdate(
            petName: "Roxie",
            petBreed: "Jindo",
            timestamp: "24 Jul 2025 - 5:31pm",
            image: nil,
            tags: ["Walk 🦮", "Happy 😁"],
            xpGained: 25,
            description: "Luna went for a walk and played with the other dogs and jumped into the pool. Luna went for a walk and played with the other..."
        ))
        
        UpdateCard(update: PetUpdate(
            petName: "Bailey",
            petBreed: "Bordoodle",
            timestamp: "23 Jul 2025 - 2:15pm",
            image: nil,
            tags: ["Training 🎾", "Good 👍"],
            xpGained: 15,
            description: "Bailey learned a new trick today! Successfully mastered 'roll over' after practicing for 30 minutes. Very proud of the progress..."
        ))
    }
    .padding()
}