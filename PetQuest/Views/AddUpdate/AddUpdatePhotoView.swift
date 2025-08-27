import SwiftUI

struct AddUpdatePhotoView: View {
    let pet: GamePet
    @State private var selectedImage: UIImage?
    @State private var showingImagePicker = false
    @State private var showingCamera = false
    @State private var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @State private var navigateToDetails = false
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack(spacing: 0) {
            // Header
            NavigationHeader(title: "Add update") {
                presentationMode.wrappedValue.dismiss()
            }
            
            // Content
            VStack(spacing: 32) {
                VStack(spacing: 20) {
                    Text("Step 1/2")
                        .font(.h4)
                        .foregroundColor(Color.brandPrimary)
                    
                    VStack(spacing: 8) {
                        Text("Add a photo")
                            .font(.custom("Fredoka-SemiBold", size: 20))
                            .foregroundColor(Color.text1)
                        
                        Text("Take or upload a photo of your pet")
                            .font(.body1)
                            .foregroundColor(Color.text1)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 20)
                    }
                }
                
                // Photo Frame
                ZStack {
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.borderPrimary, lineWidth: 2)
                        .frame(width: 280, height: 280)
                        .background(Color.white)
                    
                    if let selectedImage = selectedImage {
                        Image(uiImage: selectedImage)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 276, height: 276)
                            .clipped()
                            .cornerRadius(14)
                    } else {
                        Image(systemName: "photo")
                            .font(.system(size: 80))
                            .foregroundColor(Color.borderPrimary)
                    }
                }
                
                Spacer()
            }
            .padding(.horizontal, 20)
            
            // Bottom Buttons
            VStack(spacing: 20) {
                PrimaryButton(
                    title: "Take photo",
                    icon: "camera"
                ) {
                    sourceType = .camera
                    showingCamera = true
                }
                
                SecondaryButton(
                    title: "Choose photo",
                    icon: "photo"
                ) {
                    sourceType = .photoLibrary
                    showingImagePicker = true
                }
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 20)
        }
        .background(Color.white)
        .navigationBarHidden(true)
        .sheet(isPresented: $showingImagePicker) {
            ImagePicker(selectedImage: $selectedImage, sourceType: sourceType)
        }
        .sheet(isPresented: $showingCamera) {
            ImagePicker(selectedImage: $selectedImage, sourceType: .camera)
        }
        .onChange(of: selectedImage) { newImage in
            if newImage != nil {
                // Automatically navigate when image is selected
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    navigateToDetails = true
                }
            }
        }
        .background(
            NavigationLink(
                destination: Group {
                    if let image = selectedImage {
                        AddUpdateDetailsView(pet: pet, selectedImage: image)
                    } else {
                        EmptyView()
                    }
                },
                isActive: $navigateToDetails
            ) {
                EmptyView()
            }
            .hidden()
        )
    }
}

// Note: Using the same ImagePicker component from AddPetPhotoView
// If needed, this can be extracted to a shared component file

#Preview {
    AddUpdatePhotoView(pet: GamePet(
        name: "Roxie",
        breed: "Jindo",
        type: .fire,
        level: 22,
        hp: 71,
        attack: 52,
        defense: 38,
        speed: 84
    ))
}