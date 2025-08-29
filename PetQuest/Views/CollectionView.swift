import SwiftUI

struct MyCollectionView: View {
    @State private var searchText = ""
    @StateObject private var petStore = PetStore()
    @StateObject private var navigationManager = NavigationManager()
    
    var filteredPets: [GamePet] {
        if searchText.isEmpty {
            return petStore.pets
        } else {
            return petStore.pets.filter { pet in
                pet.name.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
    
    var body: some View {
        VStack(spacing: 24) {
                // Header
                HStack {
                    Text("My Collection")
                        .textStyle(TextStyles.H1())
                    
                    Spacer()
                    
                    NavigationLink(
                        destination: AddPetView()
                            .environmentObject(petStore)
                            .environmentObject(navigationManager),
                        isActive: $navigationManager.isAddPetFlowActive
                    ) {
                        HStack(spacing: 6) {
                            Image(systemName: "plus")
                                .font(.system(size: 16, weight: .medium))
                            
                            Text("Add pet")
                                .font(.h4)
                        }
                        .foregroundColor(.white)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 8)
                        .background(Color.brandPrimary)
                        .cornerRadius(20)
                    }
                    .onTapGesture {
                        navigationManager.startAddPetFlow()
                    }
                }
                
                // Search and Filter
                HStack(spacing: 12) {
                    SearchBar(searchText: $searchText, placeholder: "Search")
                    
                    FilterButton {
                        // Filter action
                    }
                }
                
                // All pets section
                VStack(alignment: .leading, spacing: 12) {
                    VStack(alignment: .leading, spacing: 8) {
                        Text(searchText.isEmpty ? "All pets (\(filteredPets.count))" : "Results (\(filteredPets.count))")
                            .font(.h5)
                            .foregroundColor(Color.text2)
                        
                        Rectangle()
                            .fill(Color.borderPrimary)
                            .frame(height: 1)
                    }
                    
                    // Pet Cards
                    ScrollView {
                        LazyVStack(spacing: 12) {
                            ForEach(filteredPets) { pet in
                                NavigationLink(destination: PetProfileView(pet: pet)) {
                                    AnimalPreviewCard(pet: pet)
                                }
                                .buttonStyle(PlainButtonStyle())
                            }
                        }
                    }
                }
                
                Spacer()
            }
            .padding(.horizontal, 20)
            .padding(.top, 20)
            .background(Color.white)
    }
}


#Preview {
    MyCollectionView()
}