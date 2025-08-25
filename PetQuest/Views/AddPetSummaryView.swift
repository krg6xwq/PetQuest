import SwiftUI

struct AddPetSummaryView: View {
    let selectedImage: UIImage
    let petName: String
    let selectedAnimal: String
    let selectedBreed: String
    let petStore: PetStore
    let onFinish: () -> Void
    
    // Dummy/placeholder data for now
    let level = 5
    let petType: GamePetType = .fire
    let hp = 71
    let attack = 52
    let defense = 38
    let speed = 84
    
    var body: some View {
        VStack(spacing: 0) {
            VStack(spacing: 32) {
                // Introducing text
                Text("Introducing...")
                    .font(.custom("Fredoka-SemiBold", size: 24))
                    .foregroundColor(Color.text2)
                
                VStack(spacing: 20) {
                    // Pet name and level
                    HStack {
                        Text(petName)
                            .textStyle(TextStyles.H1())
                        
                        Spacer()
                        
                        Text("Lvl \(level)")
                            .font(.custom("Fredoka-SemiBold", size: 24))
                            .foregroundColor(Color.text2)
                    }
                    
                    // Pet image with colored border
                    ZStack {
                        RoundedRectangle(cornerRadius: 16)
                            .fill(Color.petType(petType.rawValue))
                            .frame(width: 280, height: 280)
                        
                        Image(uiImage: selectedImage)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 240, height: 240)
                            .clipped()
                            .cornerRadius(8)
                            .shadow(color: Color.black.opacity(0.25), radius: 4, x: 4, y: 6)
                    }
                    
                    // Pet info card
                    VStack(spacing: 20) {
                        HStack {
                            Text("Type:")
                                .font(.body1)
                                .foregroundColor(Color.text2)
                            
                            Spacer()
                            
                            HStack(spacing: 4) {
                                Image(systemName: "circle.fill")
                                    .font(.system(size: 16))
                                    .foregroundColor(Color.petType(petType.rawValue))
                                
                                Text(petType.rawValue.capitalized)
                                    .font(.h5)
                                    .foregroundColor(Color.petType(petType.rawValue))
                            }
                        }
                        
                        HStack {
                            Text("Animal:")
                                .font(.body1)
                                .foregroundColor(Color.text2)
                            
                            Spacer()
                            
                            Text(selectedAnimal)
                                .font(.body1)
                                .foregroundColor(Color.text1)
                        }
                        
                        HStack {
                            Text("Breed:")
                                .font(.body1)
                                .foregroundColor(Color.text2)
                            
                            Spacer()
                            
                            Text(selectedBreed)
                                .font(.body1)
                                .foregroundColor(Color.text1)
                        }
                    }
                    .padding(12)
                    .background(Color.white)
                    .cornerRadius(8)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.borderPrimary, lineWidth: 1)
                    )
                    
                    // Stats card
                    StatsCardView(hp: hp, attack: attack, defense: defense, speed: speed)
                }
            }
            .padding(.horizontal, 20)
            .padding(.top, 40)
            
            Spacer()
            
            // Finish button
            PrimaryButton(title: "Finish") {
                // Create new GamePet and add to store
                let newPet = GamePet(
                    name: petName,
                    breed: selectedBreed,
                    type: petType,
                    level: level,
                    hp: hp,
                    attack: attack,
                    defense: defense,
                    speed: speed
                )
                petStore.addPet(newPet)
                onFinish()
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 20)
        }
        .background(Color.white)
        .navigationBarHidden(true)
    }
}

struct StatsCardView: View {
    let hp: Int
    let attack: Int
    let defense: Int
    let speed: Int
    
    var body: some View {
        VStack(spacing: 8) {
            StatRow(label: "HP", value: hp, color: Color.attributeHP, maxValue: 100)
            StatRow(label: "Attack", value: attack, color: Color.attributeAttack, maxValue: 100)
            StatRow(label: "Defense", value: defense, color: Color.attributeDefense, maxValue: 100)
            StatRow(label: "Speed", value: speed, color: Color.attributeSpeed, maxValue: 100)
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 8)
        .background(Color.white)
        .cornerRadius(8)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.borderPrimary, lineWidth: 1)
        )
    }
}

struct StatRow: View {
    let label: String
    let value: Int
    let color: Color
    let maxValue: Int
    
    private var progress: CGFloat {
        CGFloat(value) / CGFloat(maxValue)
    }
    
    var body: some View {
        HStack(spacing: 8) {
            Text(label)
                .font(.body2)
                .foregroundColor(Color.text2)
                .frame(width: 60, alignment: .center)
            
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 4)
                        .fill(Color(red: 0.97, green: 0.97, blue: 0.97)) // Gray background
                        .frame(height: 8)
                    
                    RoundedRectangle(cornerRadius: 4)
                        .fill(color)
                        .frame(width: geometry.size.width * progress, height: 8)
                }
            }
            .frame(height: 8)
            
            Text("\(value)")
                .font(.body1)
                .foregroundColor(Color.text1)
                .frame(width: 20, alignment: .leading)
        }
    }
}

#Preview {
    AddPetSummaryView(
        selectedImage: UIImage(systemName: "photo")!,
        petName: "Roxie",
        selectedAnimal: "Dog",
        selectedBreed: "Jindo",
        petStore: PetStore()
    ) {
        print("Finish tapped")
    }
}