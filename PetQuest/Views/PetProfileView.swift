import SwiftUI

struct PetProfileView: View {
    let pet: GamePet
    @Environment(\.presentationMode) var presentationMode
    
    // Mock data for updates
    let recentUpdates: [PetUpdate] = [
        PetUpdate(
            petName: "Roxie",
            petBreed: "Jindo",
            timestamp: "24 Jul 2025 - 5:31pm",
            image: nil,
            tags: ["Walk 🦮", "Happy 😁"],
            xpGained: 25,
            description: "Luna went for a walk and played with the other dogs and jumped into the pool. Luna went for a walk and played with the other dogs..."
        ),
        PetUpdate(
            petName: "Roxie",
            petBreed: "Jindo", 
            timestamp: "24 Jul 2025 - 5:31pm",
            image: nil,
            tags: ["Walk 🦮", "Happy 😁"],
            xpGained: 25,
            description: "Luna went for a walk and played with the other dogs and jumped into the pool. Luna went for a walk and played with the other dogs..."
        )
    ]
    
    var body: some View {
        VStack(spacing: 0) {
            // Main Content
            VStack(spacing: 24) {
                // Header
                HStack {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        HStack(spacing: 8) {
                            Image(systemName: "chevron.left")
                                .font(.system(size: 16))
                                .foregroundColor(Color.text2)
                            
                            Text("Back")
                                .font(.h4)
                                .foregroundColor(Color.text2)
                        }
                    }
                    .buttonStyle(PlainButtonStyle())
                    
                    Spacer()
                    
                    Text("Pet profile")
                        .font(.h4)
                        .foregroundColor(Color.text2)
                    
                    Spacer()
                        .frame(width: 64)
                }
                
                // Pet Info Section
                VStack(spacing: 20) {
                    // Name and Level
                    HStack(alignment: .bottom) {
                        Text(pet.name)
                            .textStyle(TextStyles.H1())
                        
                        Spacer()
                        
                        Text("Lvl \(pet.level)")
                            .font(.custom("Fredoka-SemiBold", size: 24))
                            .foregroundColor(Color.text2)
                    }
                    
                    // XP Bar
                    VStack(spacing: 4) {
                        // Progress Bar
                        GeometryReader { geometry in
                            ZStack(alignment: .leading) {
                                RoundedRectangle(cornerRadius: 4)
                                    .fill(Color(red: 0.97, green: 0.97, blue: 0.97))
                                    .frame(height: 8)
                                
                                RoundedRectangle(cornerRadius: 4)
                                    .fill(Color.brandPrimary)
                                    .frame(width: geometry.size.width * 0.875, height: 8) // 1750/2000 = 0.875
                            }
                        }
                        .frame(height: 8)
                        
                        // XP Text
                        HStack {
                            Text("1750/2000 XP")
                                .font(.caption)
                                .foregroundColor(Color.text2)
                            
                            Spacer()
                            
                            Text("250 XP to next level")
                                .font(.caption)
                                .foregroundColor(Color.text2)
                        }
                    }
                }
                
                // Pet Image and Info Card
                HStack(spacing: 20) {
                    // Pet Image
                    Rectangle()
                        .fill(Color.grey300)
                        .frame(width: 120, height: 120)
                        .cornerRadius(8)
                        .overlay(
                            Image(systemName: "photo")
                                .font(.system(size: 32))
                                .foregroundColor(.gray)
                        )
                    
                    // Pet Info Card
                    PetInfoCard(pet: pet)
                        .frame(width: 210, height: 120)
                }
                
                // Stats Card
                StatsCardView(hp: pet.hp, attack: pet.attack, defense: pet.defense, speed: pet.speed)
                
                // Updates Section
                VStack(spacing: 12) {
                    HStack {
                        Text("Updates")
                            .font(.custom("Fredoka-SemiBold", size: 24))
                            .foregroundColor(Color.text1)
                        
                        Spacer()
                        
                        Button(action: {
                            // See all updates
                        }) {
                            Text("See all")
                                .font(.h4)
                                .foregroundColor(Color.petType(pet.type.rawValue))
                        }
                    }
                    
                    // Recent Updates
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 12) {
                            ForEach(recentUpdates) { update in
                                PetProfileUpdateCard(update: update)
                                    .frame(width: 200)
                            }
                        }
                        .padding(.horizontal, 20)
                    }
                    .padding(.horizontal, -20)
                }
                
                Spacer()
            }
            .padding(.horizontal, 20)
            .padding(.top, 20)
            .background(Color.white)
            
            // Update Button
            VStack {
                Button(action: {
                    // Add update action
                }) {
                    HStack(spacing: 8) {
                        Image(systemName: "plus")
                            .font(.system(size: 20, weight: .medium))
                        
                        Text("Update")
                            .font(.h4)
                    }
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 48)
                    .background(Color.petType(pet.type.rawValue))
                    .cornerRadius(100)
                }
                .buttonStyle(PlainButtonStyle())
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 20)
            .background(Color.white)
        }
        .navigationBarHidden(true)
    }
}

struct PetInfoCard: View {
    let pet: GamePet
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            VStack(spacing: 6) {
                // Type
                HStack {
                    Text("Type:")
                        .font(.body1)
                        .foregroundColor(Color.text2)
                    
                    Spacer()
                    
                    HStack(spacing: 4) {
                        Image(systemName: "circle.fill")
                            .font(.system(size: 16))
                            .foregroundColor(Color.petType(pet.type.rawValue))
                        
                        Text(pet.type.rawValue.capitalized)
                            .font(.h5)
                            .foregroundColor(Color.petType(pet.type.rawValue))
                    }
                }
                
                // Animal
                HStack {
                    Text("Animal:")
                        .font(.body1)
                        .foregroundColor(Color.text2)
                    
                    Spacer()
                    
                    Text("Dog") // Could be dynamic based on pet data
                        .font(.body1)
                        .foregroundColor(Color.text1)
                }
                
                // Breed
                HStack {
                    Text("Breed:")
                        .font(.body1)
                        .foregroundColor(Color.text2)
                    
                    Spacer()
                    
                    Text(pet.breed)
                        .font(.body1)
                        .foregroundColor(Color.text1)
                }
            }
            
            Spacer()
            
            // Collection Date
            Text("Collected on 20 July 2025")
                .font(.caption)
                .foregroundColor(Color.text2)
        }
        .padding(12)
        .background(Color.petType(pet.type.rawValue).opacity(0.15))
        .cornerRadius(8)
    }
}

struct PetProfileUpdateCard: View {
    let update: PetUpdate
    
    var body: some View {
        VStack(spacing: 8) {
            // Image
            if let image = update.image {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 160)
                    .clipped()
                    .cornerRadius(8, corners: [.topLeft, .topRight])
            } else {
                Rectangle()
                    .fill(Color.grey300)
                    .frame(height: 160)
                    .cornerRadius(8, corners: [.topLeft, .topRight])
                    .overlay(
                        Image(systemName: "photo")
                            .font(.system(size: 32))
                            .foregroundColor(.gray)
                    )
            }
            
            VStack(alignment: .leading, spacing: 8) {
                // Date
                Text(update.timestamp)
                    .font(.h5)
                    .foregroundColor(Color.text1)
                
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
    PetProfileView(pet: GamePet(
        name: "Roxie",
        breed: "Jindo",
        type: .fire,
        level: 22,
        hp: 71,
        attack: 52,
        defense: 38,
        speed: 84
    ))
}