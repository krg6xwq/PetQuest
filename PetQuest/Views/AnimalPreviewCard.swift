import SwiftUI

struct AnimalPreviewCard: View {
    let pet: GamePet
    
    var body: some View {
        HStack(spacing: 0) {
            // Pet Image
            Image(systemName: "photo")
                .frame(width: 80, height: 80)
                .background(Color.grey300)
                .cornerRadius(8)
            
            // Pet Info Section
            VStack(alignment: .leading, spacing: 0) {
                // Top section with name, level, breed, and type
                VStack(alignment: .leading, spacing: 4) {
                    HStack {
                        Text(pet.name)
                            .font(.custom("Fredoka-Medium", size: 18))
                            .foregroundColor(Color.text1)
                        
                        Spacer()
                        
                        Text("Lvl \(pet.level)")
                            .font(.custom("Quicksand-Regular", size: 16))
                            .foregroundColor(Color.text1)
                    }
                    
                    HStack {
                        Text(pet.breed)
                            .font(.custom("Quicksand-Regular", size: 14))
                            .foregroundColor(Color.text2)
                        
                        Spacer()
                        
                        // Type Badge
                        HStack(spacing: 4) {
                            Circle()
                                .fill(Color.petType(pet.type.rawValue))
                                .frame(width: 16, height: 16)
                            
                            Text(pet.type.rawValue.capitalized)
                                .font(.custom("Fredoka-Medium", size: 14))
                                .foregroundColor(Color.petType(pet.type.rawValue))
                        }
                        .padding(.horizontal, 12)
                        .padding(.vertical, 2)
                        .background(Color.white)
                        .cornerRadius(20)
                    }
                }
                .padding(.horizontal, 12)
                .padding(.top, 8)
                .padding(.bottom, 4)
                
                // Stats Section
                HStack {
                    VStack(alignment: .leading, spacing: 4) {
                        HStack {
                            Text("HP")
                                .font(.custom("Quicksand-Regular", size: 14))
                                .foregroundColor(Color.text2)
                            
                            Spacer()
                            
                            Text("\(pet.hp)")
                                .font(.custom("Quicksand-Regular", size: 14))
                                .foregroundColor(Color.text1)
                        }
                        
                        HStack {
                            Text("Attack")
                                .font(.custom("Quicksand-Regular", size: 14))
                                .foregroundColor(Color.text2)
                            
                            Spacer()
                            
                            Text("\(pet.attack)")
                                .font(.custom("Quicksand-Regular", size: 14))
                                .foregroundColor(Color.text1)
                        }
                    }
                    .frame(width: 91)
                    
                    VStack(alignment: .leading, spacing: 4) {
                        HStack {
                            Text("Defense")
                                .font(.custom("Quicksand-Regular", size: 14))
                                .foregroundColor(Color.text2)
                            
                            Spacer()
                            
                            Text("\(pet.defense)")
                                .font(.custom("Quicksand-Regular", size: 14))
                                .foregroundColor(Color.text1)
                        }
                        
                        HStack {
                            Text("Speed")
                                .font(.custom("Quicksand-Regular", size: 14))
                                .foregroundColor(Color.text2)
                            
                            Spacer()
                            
                            Text("\(pet.speed)")
                                .font(.custom("Quicksand-Regular", size: 14))
                                .foregroundColor(Color.text1)
                        }
                    }
                    .frame(width: 91)
                }
                .padding(.horizontal, 12)
                .padding(.vertical, 8)
                .background(Color.white)
            }
            .background(Color.petType(pet.type.rawValue).opacity(0.3))
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