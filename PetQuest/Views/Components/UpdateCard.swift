import SwiftUI

struct UpdateCard: View {
    let update: PetUpdate
    let onPetNameTapped: () -> Void
    let onContentTapped: () -> Void
    
    var body: some View {
        VStack(spacing: 8) {
            // Header with pet name and timestamp
            HStack {
                Button(action: onPetNameTapped) {
                    Text("\(update.petName) (\(update.petBreed))")
                        .font(.h5)
                        .foregroundColor(Color.brandPrimary)
                }
                .buttonStyle(PlainButtonStyle())
                
                Spacer()
                
                Text(update.timestamp)
                    .font(.body2)
                    .foregroundColor(Color.text2)
            }
            
            // Update content card
            Button(action: onContentTapped) {
                HStack(alignment: .top, spacing: 12) {
                    // Pet Image
                    if let image = update.image {
                        Image(uiImage: image)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 96, height: 96)
                            .clipped()
                            .cornerRadius(4)
                    } else {
                        Image("dog-walk")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 96, height: 96)
                            .clipped()
                            .cornerRadius(4)
                    }
                    
                    // Content
                    VStack(alignment: .leading, spacing: 4) {
                        // Tags and XP row
                        HStack {
                            // Tags
                            HStack(spacing: 4) {
                                ForEach(update.tags, id: \.self) { tag in
                                    UpdateTag(text: tag)
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
                            .lineLimit(4)
                            .multilineTextAlignment(.leading)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding(8)
                .background(Color.bgTertiary)
                .cornerRadius(8)
            }
            .buttonStyle(PlainButtonStyle())
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
        UpdateCard(
            update: PetUpdate(
                petName: "Roxie",
                petBreed: "Jindo",
                timestamp: "24 Jul 2025 - 5:31pm",
                image: nil,
                tags: ["Walk 🦮", "Happy 😁"],
                xpGained: 25,
                description: "Luna went for a walk and played with the other dogs and jumped into the pool. Luna went for a walk and played with the other..."
            ),
            onPetNameTapped: { print("Pet name tapped") },
            onContentTapped: { print("Content tapped") }
        )
        
        UpdateCard(
            update: PetUpdate(
                petName: "Bailey",
                petBreed: "Bordoodle",
                timestamp: "23 Jul 2025 - 2:15pm",
                image: nil,
                tags: ["Training 🎾", "Good 👍"],
                xpGained: 15,
                description: "Bailey learned a new trick today! Successfully mastered 'roll over' after practicing for 30 minutes. Very proud of the progress..."
            ),
            onPetNameTapped: { print("Pet name tapped") },
            onContentTapped: { print("Content tapped") }
        )
    }
    .padding()
}