import SwiftUI
import PhotosUI

struct AddPetView: View {
    @State private var selectedImage: UIImage?
    @State private var showingImagePicker = false
    @State private var showingCamera = false
    @State private var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @State private var navigateToDetails = false
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var petStore: PetStore
    @EnvironmentObject var navigationManager: NavigationManager
    
    var body: some View {
        VStack(spacing: 0) {
            // Header
            NavigationHeader(title: "Add new pet") {
                navigationManager.finishAddPetFlow()
            }
            
            // Content
            VStack(spacing: 32) {
                VStack(spacing: 20) {
                    Text("Step 1/3")
                        .font(.h4)
                        .foregroundColor(Color.brandPrimary)
                    
                    VStack(spacing: 8) {
                        Text("Add a photo")
                            .textStyle(TextStyles.H3())
                            .foregroundColor(Color.text1)
                        
                        Text("Take or upload a photo of your pet that clearly shows its face and body")
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
            
            // Bottom Buttons - Different layout based on image state
            if selectedImage == nil {
                // No image selected - show full-width buttons
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
            } else {
                // Image selected - show side-by-side buttons + Next button
                VStack(spacing: 20) {
                    HStack(spacing: 12) {
                        SecondaryButton(
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
                    
                    // Next button (primary style, full-width)
                    PrimaryButton(
                        title: "Next"
                    ) {
                        navigateToDetails = true
                    }
                }
                .padding(.horizontal, 20)
            }
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
                        AddPetDetailsView(selectedImage: image)
                            .environmentObject(petStore)
                            .environmentObject(navigationManager)
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

struct ImagePicker: UIViewControllerRepresentable {
    @Binding var selectedImage: UIImage?
    var sourceType: UIImagePickerController.SourceType
    @Environment(\.dismiss) private var dismiss
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.sourceType = sourceType
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        let parent: ImagePicker
        
        init(_ parent: ImagePicker) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
            if let image = info[.originalImage] as? UIImage {
                parent.selectedImage = image
            }
            parent.dismiss()
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            parent.dismiss()
        }
    }
}

#Preview {
    AddPetView()
}