import SwiftUI

struct MyCollectionView: View {
    @State private var searchText = ""
    @State private var selectedTab: TabItem = .collection
    @StateObject private var petStore = PetStore()
    @StateObject private var navigationManager = NavigationManager()
    
    var body: some View {
        ZStack(alignment: .bottom) {
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
                        Text("All pets (\(petStore.pets.count))")
                            .font(.h5)
                            .foregroundColor(Color.text2)
                        
                        Rectangle()
                            .fill(Color.borderPrimary)
                            .frame(height: 1)
                    }
                    
                    // Pet Cards
                    ScrollView {
                        LazyVStack(spacing: 12) {
                            ForEach(petStore.pets) { pet in
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
    }
}


#Preview {
    MyCollectionView()
}