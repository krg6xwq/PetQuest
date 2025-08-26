import SwiftUI

struct AnimalPreviewCard: View {
    let pet: GamePet
    
    var body: some View {
        HStack(spacing: 0) {
            // Pet Image - Square 80x80
            Rectangle()
                .fill(Color.grey300)
                .frame(width: 110)
                .overlay(
                    Image(systemName: "photo")
                        .font(.system(size: 24))
                        .foregroundColor(.gray)
                )
            
            // Pet Info Section
            VStack(spacing: 0) {
                // Top info section with colored background
                VStack(alignment: .leading, spacing: 4) {
                    HStack {
                        Text(pet.name)
                            .textStyle(TextStyles.H4())
                        
                        Spacer()
                        
                        Text("Lvl \(pet.level)")
                            .textStyle(TextStyles.Body1())
                    }
                    
                    HStack {
                        Text(pet.breed)
                            .textStyle(TextStyles.Body2())
                        
                        Spacer()
                        
                        // Type Badge
                        HStack(spacing: 4) {
                            Image(systemName: "circle.fill")
                                .font(.system(size: 16))
                                .foregroundColor(Color.petType(pet.type.rawValue))
                            
                            Text(pet.type.rawValue.capitalized)
                                .font(.h6)
                                .foregroundColor(Color.petType(pet.type.rawValue))
                        }
                        .padding(.horizontal, 6)
                        .padding(.vertical, 2)
                        .background(Color.white)
                        .cornerRadius(10)
                    }
                }
                .padding(.horizontal, 12)
                .padding(.vertical, 8)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color.petType(pet.type.rawValue).opacity(0.15))
                
                // Stats Section - White background, full width
                HStack(spacing: 32) {
                    VStack(alignment: .leading, spacing: 4) {
                        HStack {
                            Text("HP")
                                .textStyle(TextStyles.Body2())
                            
                            Spacer()
                            
                            Text("\(pet.hp)")
                                .font(.body2)
                                .foregroundColor(Color.text1)
                        }
                        
                        HStack {
                            Text("Attack")
                                .textStyle(TextStyles.Body2())
                            
                            Spacer()
                            
                            Text("\(pet.attack)")
                                .font(.body2)
                                .foregroundColor(Color.text1)
                        }
                    }
                    .frame(width: 91)
                    
                    VStack(alignment: .leading, spacing: 4) {
                        HStack {
                            Text("Defense")
                                .textStyle(TextStyles.Body2())
                            
                            Spacer()
                            
                            Text("\(pet.defense)")
                                .font(.body2)
                                .foregroundColor(Color.text1)
                        }
                        
                        HStack {
                            Text("Speed")
                                .textStyle(TextStyles.Body2())
                            
                            Spacer()
                            
                            Text("\(pet.speed)")
                                .font(.body2)
                                .foregroundColor(Color.text1)
                        }
                    }
                    .frame(width: 91)
                }
                .padding(.horizontal, 12)
                .padding(.vertical, 4)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color.white)
            }
        }
        .cornerRadius(8)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.borderPrimary, lineWidth: 1)
        )
    }
}

struct GamePet: Identifiable {
    let id = UUID()
    let name: String
    let breed: String
    let type: GamePetType
    let level: Int
    let hp: Int
    let attack: Int
    let defense: Int
    let speed: Int
}

enum GamePetType: String, CaseIterable {
    case fire = "fire"
    case water = "water"
    case earth = "earth"
    case air = "air"
    case lightning = "lightning"
    case frost = "frost"
    case shadow = "shadow"
    case grass = "grass"
}

#Preview {
    VStack(spacing: 16) {
        AnimalPreviewCard(pet: GamePet(
            name: "Roxie",
            breed: "Jindo",
            type: .fire,
            level: 22,
            hp: 71,
            attack: 52,
            defense: 38,
            speed: 84
        ))
        
        AnimalPreviewCard(pet: GamePet(
            name: "Luna",
            breed: "Jindo",
            type: .water,
            level: 20,
            hp: 71,
            attack: 52,
            defense: 38,
            speed: 84
        ))
        
        AnimalPreviewCard(pet: GamePet(
            name: "Troy",
            breed: "German Shepherd",
            type: .grass,
            level: 99,
            hp: 71,
            attack: 52,
            defense: 38,
            speed: 84
        ))
    }
    .padding()
}