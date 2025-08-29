import SwiftUI

struct SimpleUpdateCard: View {
    let update: PetUpdate
    
    var body: some View {
        VStack(spacing: 8) {
            // Header with timestamp and XP (no pet name)
            HStack {
                Text(update.timestamp)
                    .font(.body1)
                    .foregroundColor(Color.text2)
                
                Spacer()
                
                Text("+\(update.xpGained) XP")
                    .font(.body1)
                    .foregroundColor(Color.brandPrimary)
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
                    Image("dog-walk")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 96, height: 96)
                        .clipped()
                        .cornerRadius(8)
                }
                
                // Content
                VStack(alignment: .leading, spacing: 4) {
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
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(8)
            .background(Color.bgTertiary)
            .cornerRadius(8)
        }
    }
}

#Preview {
    VStack(spacing: 12) {
        SimpleUpdateCard(update: PetUpdate(
            petName: "Roxie",
            petBreed: "Jindo",
            timestamp: "24 Jul 2025 - 5:31pm",
            image: nil,
            tags: ["Walk 🦮", "Happy 😁"],
            xpGained: 25,
            description: "Luna went for a walk and played with the other dogs and jumped into the pool. Luna went for a walk and played with the other..."
        ))
        
        SimpleUpdateCard(update: PetUpdate(
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