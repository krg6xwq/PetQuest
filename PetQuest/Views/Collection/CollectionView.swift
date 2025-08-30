import SwiftUI

struct MyCollectionView: View {
    @State private var searchText = ""
    @State private var showingFilters = false
    @State private var sortBy: SortOption = .level
    @State private var filterType: GamePetType?
    @State private var filterBreed = ""
    @State private var levelRange: ClosedRange<Double> = 1...99
    @StateObject private var petStore = PetStore()
    @StateObject private var navigationManager = NavigationManager()
    
    var filteredPets: [GamePet] {
        var pets = petStore.pets
        
        // Apply search filter
        if !searchText.isEmpty {
            pets = pets.filter { pet in
                pet.name.localizedCaseInsensitiveContains(searchText)
            }
        }
        
        // Apply type filter
        if let filterType = filterType {
            pets = pets.filter { $0.type == filterType }
        }
        
        // Apply breed filter
        if !filterBreed.isEmpty {
            pets = pets.filter { $0.breed == filterBreed }
        }
        
        // Apply level range filter
        pets = pets.filter { pet in
            Double(pet.level) >= levelRange.lowerBound && Double(pet.level) <= levelRange.upperBound
        }
        
        // Apply sorting
        switch sortBy {
        case .name:
            pets = pets.sorted { $0.name < $1.name }
        case .level:
            pets = pets.sorted { $0.level > $1.level }
        case .breed:
            pets = pets.sorted { $0.breed < $1.breed }
        case .type:
            pets = pets.sorted { $0.type.rawValue < $1.type.rawValue }
        case .dateCollected, .lastUpdated:
            // These would require additional date fields in GamePet
            pets = pets.sorted { $0.name < $1.name }
        }
        
        return pets
    }
    
    var hasActiveFilters: Bool {
        !searchText.isEmpty || filterType != nil || !filterBreed.isEmpty || levelRange != 1...99
    }
    
    var activeFilterCount: Int {
        var count = 0
        if filterType != nil { count += 1 }
        if !filterBreed.isEmpty { count += 1 }
        if levelRange != 1...99 { count += 1 }
        return count
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
                    
                    FilterButton(activeFilterCount: activeFilterCount) {
                        showingFilters = true
                    }
                }
                
                // All pets section
                VStack(alignment: .leading, spacing: 12) {
                    VStack(alignment: .leading, spacing: 8) {
                        Text(hasActiveFilters ? "Results (\(filteredPets.count))" : "All pets (\(filteredPets.count))")
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
            .sheet(isPresented: $showingFilters) {
                FilterOptionsView(
                    isPresented: $showingFilters,
                    currentSortBy: sortBy,
                    currentType: filterType,
                    currentBreed: filterBreed,
                    currentLevelRange: levelRange,
                    onApplyFilters: { selectedSortBy, selectedType, selectedBreed, selectedLevelRange in
                        sortBy = selectedSortBy
                        filterType = selectedType
                        filterBreed = selectedBreed
                        levelRange = selectedLevelRange
                    }
                )
            }
    }
}


#Preview {
    MyCollectionView()
}