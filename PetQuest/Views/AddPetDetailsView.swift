import SwiftUI

struct AddPetDetailsView: View {
    let selectedImage: UIImage
    @State private var petName = ""
    @State private var selectedAnimal = "Dog"
    @State private var selectedBreed = "Labrador"
    @State private var isOwner = true
    @State private var showingAnimalPicker = false
    @State private var showingBreedPicker = false
    @Environment(\.presentationMode) var presentationMode
    
    let animalOptions = ["Dog", "Cat", "Rabbit", "Bird", "Fish", "Hamster"]
    let breedOptions = ["Labrador", "Golden Retriever", "German Shepherd", "Bulldog", "Poodle", "Beagle"]
    
    var body: some View {
        VStack(spacing: 0) {
            // Header
            AddPetHeader {
                presentationMode.wrappedValue.dismiss()
            }
            
            ScrollView {
                VStack(spacing: 32) {
                    VStack(spacing: 20) {
                        Text("Step 2/3")
                            .font(.h4)
                            .foregroundColor(Color.brandPrimary)
                        
                        VStack(spacing: 8) {
                            Text("Fill in details")
                                .font(.custom("Fredoka-SemiBold", size: 20))
                                .foregroundColor(Color.text1)
                            
                            Text("Select your pet's name, animal and breed")
                                .font(.body1)
                                .foregroundColor(Color.text1)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal, 20)
                        }
                    }
                    
                    VStack(spacing: 32) {
                        // Pet Image
                        Image(uiImage: selectedImage)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 120, height: 120)
                            .clipped()
                            .cornerRadius(8)
                        
                        // Form Fields
                        VStack(spacing: 20) {
                            // Pet Name Field
                            VStack(alignment: .leading, spacing: 8) {
                                Text("Pet's name")
                                    .textStyle(TextStyles.H5())
                                
                                TextField("Enter pet's name", text: $petName)
                                    .font(.body1)
                                    .foregroundColor(Color.text1)
                                    .padding(.horizontal, 20)
                                    .padding(.vertical, 12)
                                    .frame(height: 48)
                                    .background(Color.white)
                                    .cornerRadius(8)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 8)
                                            .stroke(Color.borderPrimary, lineWidth: 1)
                                    )
                            }
                            
                            // Animal Field
                            VStack(alignment: .leading, spacing: 8) {
                                Text("Animal")
                                    .textStyle(TextStyles.H5())
                                
                                Button(action: {
                                    showingAnimalPicker = true
                                }) {
                                    HStack {
                                        Text(selectedAnimal)
                                            .font(.body1)
                                            .foregroundColor(Color.text1)
                                        
                                        Spacer()
                                        
                                        Image(systemName: "chevron.down")
                                            .font(.system(size: 12, weight: .medium))
                                            .foregroundColor(Color.text2)
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
                                }
                                .buttonStyle(PlainButtonStyle())
                                
                                Text("AI detects '\(selectedAnimal)'")
                                    .font(.h6)
                                    .foregroundColor(Color.brandPrimary)
                            }
                            
                            // Breed Field
                            VStack(alignment: .leading, spacing: 8) {
                                Text("Breed")
                                    .textStyle(TextStyles.H5())
                                
                                Button(action: {
                                    showingBreedPicker = true
                                }) {
                                    HStack {
                                        Text(selectedBreed)
                                            .font(.body1)
                                            .foregroundColor(Color.text1)
                                        
                                        Spacer()
                                        
                                        Image(systemName: "chevron.down")
                                            .font(.system(size: 12, weight: .medium))
                                            .foregroundColor(Color.text2)
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
                                }
                                .buttonStyle(PlainButtonStyle())
                                
                                Text("AI detects '\(selectedBreed)'")
                                    .font(.h6)
                                    .foregroundColor(Color.brandPrimary)
                            }
                        }
                        
                        // Ownership Checkbox
                        HStack(spacing: 12) {
                            Button(action: {
                                isOwner.toggle()
                            }) {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 5.6)
                                        .fill(isOwner ? Color.brandPrimary : Color.clear)
                                        .frame(width: 28, height: 28)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 5.6)
                                                .stroke(isOwner ? Color.brandPrimary : Color.borderPrimary, lineWidth: 1)
                                        )
                                    
                                    if isOwner {
                                        Image(systemName: "checkmark")
                                            .font(.system(size: 14, weight: .bold))
                                            .foregroundColor(.white)
                                    }
                                }
                            }
                            .buttonStyle(PlainButtonStyle())
                            
                            Text("I am the owner of this pet IRL")
                                .font(.body1)
                                .foregroundColor(Color.text1)
                            
                            Spacer()
                        }
                    }
                }
                .padding(.horizontal, 20)
            }
            
            // Next Button
            VStack {
                PrimaryButton(
                    title: "Next",
                    style: .primary
                ) {
                    // Navigate to next step
                }
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 20)
        }
        .background(Color.white)
        .navigationBarHidden(true)
        .onAppear {
            // Pre-populate with detected values
            petName = "Roxie"
        }
        .actionSheet(isPresented: $showingAnimalPicker) {
            ActionSheet(
                title: Text("Select Animal"),
                buttons: animalOptions.map { animal in
                    .default(Text(animal)) {
                        selectedAnimal = animal
                    }
                } + [.cancel()]
            )
        }
        .actionSheet(isPresented: $showingBreedPicker) {
            ActionSheet(
                title: Text("Select Breed"),
                buttons: breedOptions.map { breed in
                    .default(Text(breed)) {
                        selectedBreed = breed
                    }
                } + [.cancel()]
            )
        }
    }
}

#Preview {
    AddPetDetailsView(selectedImage: UIImage(systemName: "photo")!)
}