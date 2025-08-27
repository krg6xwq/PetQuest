import SwiftUI

struct PetInfoCard: View {
    let pet: GamePet
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            VStack(spacing: 4) {
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
        .padding(8)
        .background(Color.petType(pet.type.rawValue).opacity(0.15))
        .cornerRadius(8)
    }
}

#Preview {
    VStack(spacing: 16) {
        PetInfoCard(pet: GamePet(
            name: "Roxie",
            breed: "Jindo",
            type: .fire,
            level: 22,
            hp: 71,
            attack: 52,
            defense: 38,
            speed: 84
        ))
        .frame(width: 210, height: 120)
        
        PetInfoCard(pet: GamePet(
            name: "Luna",
            breed: "Jindo",
            type: .water,
            level: 20,
            hp: 71,
            attack: 52,
            defense: 38,
            speed: 84
        ))
        .frame(width: 210, height: 120)
        
        PetInfoCard(pet: GamePet(
            name: "Kobo",
            breed: "Border Collie",
            type: .earth,
            level: 18,
            hp: 71,
            attack: 52,
            defense: 38,
            speed: 84
        ))
        .frame(width: 210, height: 120)
    }
    .padding()
}