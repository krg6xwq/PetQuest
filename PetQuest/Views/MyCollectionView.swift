import SwiftUI

struct MyCollectionView: View {
    @State private var searchText = ""
    
    let samplePets: [GamePet] = [
        GamePet(name: "Roxie", breed: "Jindo", type: .fire, level: 22, hp: 71, attack: 52, defense: 38, speed: 84),
        GamePet(name: "Luna", breed: "Jindo", type: .water, level: 20, hp: 71, attack: 52, defense: 38, speed: 84),
        GamePet(name: "Kobo", breed: "Border Collie", type: .earth, level: 18, hp: 71, attack: 52, defense: 38, speed: 84),
        GamePet(name: "Bailey", breed: "Bordoodle", type: .air, level: 17, hp: 71, attack: 52, defense: 38, speed: 84),
        GamePet(name: "Fifi", breed: "Pomeranian", type: .lightning, level: 11, hp: 71, attack: 52, defense: 38, speed: 84),
        GamePet(name: "Titus", breed: "Border Collie", type: .frost, level: 97, hp: 71, attack: 52, defense: 38, speed: 84),
        GamePet(name: "Zeno", breed: "Border Collie", type: .shadow, level: 5, hp: 71, attack: 52, defense: 38, speed: 84),
        GamePet(name: "Troy", breed: "German Shepherd", type: .grass, level: 99, hp: 71, attack: 52, defense: 38, speed: 84)
    ]
    
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack(spacing: 24) {
                // Header
                HStack {
                    Text("My Collection")
                        .font(.custom("Fredoka-Bold", size: 32))
                        .foregroundColor(Color.text1)
                    
                    Spacer()
                    
                    Button(action: {
                        // Add pet action
                    }) {
                        HStack(spacing: 6) {
                            Image(systemName: "plus")
                                .font(.system(size: 16, weight: .medium))
                            
                            Text("Add pet")
                                .font(.custom("Fredoka-Medium", size: 18))
                        }
                        .foregroundColor(.white)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 8)
                        .background(Color.brandPrimary)
                        .cornerRadius(20)
                    }
                }
                
                // Search and Filter
                HStack(spacing: 12) {
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(Color.text2)
                        
                        TextField("Search", text: $searchText)
                            .font(.custom("Fredoka-Medium", size: 16))
                            .foregroundColor(Color.text1)
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 8)
                    .background(Color.white)
                    .cornerRadius(8)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.borderPrimary, lineWidth: 1)
                    )
                    
                    Button(action: {
                        // Filter action
                    }) {
                        Image(systemName: "slider.horizontal.3")
                            .font(.system(size: 16))
                            .foregroundColor(Color.brandPrimary)
                            .frame(width: 48, height: 48)
                            .background(Color.white)
                            .cornerRadius(8)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.borderPrimary, lineWidth: 1)
                            )
                    }
                }
                
                // All pets section
                VStack(alignment: .leading, spacing: 12) {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("All pets (\(samplePets.count))")
                            .font(.custom("Fredoka-Medium", size: 16))
                            .foregroundColor(Color.text2)
                        
                        Rectangle()
                            .fill(Color.borderPrimary)
                            .frame(height: 1)
                    }
                    
                    // Pet Cards
                    ScrollView {
                        LazyVStack(spacing: 12) {
                            ForEach(samplePets) { pet in
                                AnimalPreviewCard(pet: pet)
                            }
                        }
                    }
                }
                
                Spacer()
            }
            .padding(.horizontal, 20)
            .padding(.top, 20)
            .background(Color.white)
            
            // Bottom Tab Bar
            VStack(spacing: 0) {
                Rectangle()
                    .fill(Color.borderPrimary)
                    .frame(height: 1)
                
                HStack {
                    TabBarItem(icon: "house", label: "Home", isSelected: false)
                    TabBarItem(icon: "bolt", label: "Battle", isSelected: false)
                    TabBarItem(icon: "folder", label: "Collection", isSelected: true)
                }
                .padding(.horizontal, 40)
                .padding(.vertical, 12)
                .background(Color.white)
                .frame(height: 80)
            }
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct TabBarItem: View {
    let icon: String
    let label: String
    let isSelected: Bool
    
    var body: some View {
        VStack(spacing: 4) {
            Image(systemName: icon)
                .font(.system(size: 24))
                .foregroundColor(isSelected ? Color.brandPrimary : Color.borderPrimary)
            
            Text(label)
                .font(.custom("Quicksand-Medium", size: 12))
                .foregroundColor(Color.text2)
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    MyCollectionView()
}