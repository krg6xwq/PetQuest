import SwiftUI

struct MyCollectionView: View {
    @State private var searchText = ""
    @State private var selectedTab: TabItem = .collection
    @State private var showingAddPet = false
    
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
                        .textStyle(TextStyles.H1())
                    
                    Spacer()
                    
                    PrimaryButton(
                        title: "Add pet",
                        icon: "plus",
                        style: .small
                    ) {
                        showingAddPet = true
                    }
                }
                
                // Search and Filter
                HStack(spacing: 12) {
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(Color.text2)
                        
                        TextField("Search", text: $searchText)
                            .font(.h5)
                            .foregroundColor(Color.text1)
                    }
                    .frame(height: 48)
                    .padding(.horizontal, 20)
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
                            .font(.h5)
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
            
            BottomTabBar(selectedTab: $selectedTab)
        }
        .edgesIgnoringSafeArea(.bottom)
        .sheet(isPresented: $showingAddPet) {
            AddPetView()
        }
    }
}


#Preview {
    MyCollectionView()
}