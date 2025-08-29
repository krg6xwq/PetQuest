import SwiftUI

struct SelectPetView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var petStore: PetStore
    @State private var searchText = ""
    @State private var selectedPet: GamePet?
    @State private var navigateToPhotoView = false
    
    var filteredPets: [GamePet] {
        if searchText.isEmpty {
            return petStore.pets
        } else {
            return petStore.pets.filter { pet in
                pet.name.localizedCaseInsensitiveContains(searchText) ||
                pet.breed.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
    
    var body: some View {
        VStack(spacing: 0) {
            // Header
            NavigationHeader(title: "Add update") {
                presentationMode.wrappedValue.dismiss()
            }
            
            // Content
            VStack(spacing: 32) {
                // Title
                Text("Select pet")
                    .font(.custom("Fredoka-SemiBold", size: 20))
                    .foregroundColor(Color.text1)
                
                // Search and Filter Section
                VStack(spacing: 24) {
                    // Search Bar and Filter
                    HStack(spacing: 12) {
                        // Search Bar
                        HStack {
                            Text("Search")
                                .font(.h5)
                                .foregroundColor(Color.text2)
                            
                            Spacer()
                        }
                        .padding(.horizontal, 20)
                        .padding(.vertical, 12)
                        .frame(height: 48)
                        .background(Color.white)
                        .cornerRadius(8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.borderPrimary, lineWidth: 1)
                        )
                        
                        // Filter Button
                        Button(action: {
                            // Filter action
                        }) {
                            Image(systemName: "slider.horizontal.3")
                                .font(.system(size: 16, weight: .medium))
                                .foregroundColor(Color.brandPrimary)
                        }
                        .frame(width: 48, height: 48)
                        .background(Color.white)
                        .cornerRadius(8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.borderPrimary, lineWidth: 1)
                        )
                    }
                    
                    // Pets List Section
                    VStack(spacing: 12) {
                        // Section Header
                        VStack(spacing: 8) {
                            HStack {
                                Text("All pets (\(filteredPets.count))")
                                    .font(.h5)
                                    .foregroundColor(Color.text2)
                                
                                Spacer()
                            }
                            
                            // Divider line
                            Rectangle()
                                .fill(Color.borderPrimary)
                                .frame(height: 1)
                        }
                        
                        // Pet Cards
                        ScrollView {
                            LazyVStack(spacing: 12) {
                                ForEach(filteredPets) { pet in
                                    Button(action: {
                                        selectedPet = pet
                                        navigateToPhotoView = true
                                    }) {
                                        AnimalPreviewCard(pet: pet)
                                    }
                                    .buttonStyle(PlainButtonStyle())
                                }
                            }
                        }
                    }
                }
            }
            .padding(.horizontal, 20)
            .padding(.top, 12)
        }
        .background(Color.white)
        .navigationBarHidden(true)
        .background(
            NavigationLink(
                destination: Group {
                    if let pet = selectedPet {
                        AddUpdatePhotoView(pet: pet)
                    } else {
                        EmptyView()
                    }
                },
                isActive: $navigateToPhotoView
            ) {
                EmptyView()
            }
            .hidden()
        )
    }
}

#Preview {
    SelectPetView()
        .environmentObject(PetStore())
}