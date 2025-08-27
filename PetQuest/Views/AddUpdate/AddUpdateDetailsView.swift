import SwiftUI

struct AddUpdateDetailsView: View {
    let pet: GamePet
    let selectedImage: UIImage
    @State private var descriptionText = ""
    @State private var selectedActivity = ""
    @State private var selectedMood = ""
    @State private var showingActivityPicker = false
    @State private var showingMoodPicker = false
    @State private var activeSheet: ActiveSheet?
    
    enum ActiveSheet: Identifiable {
        case activity, mood
        var id: Int { hashValue }
    }
    @Environment(\.presentationMode) var presentationMode
    
    let activityOptions = [
        "Chilling 😌",
        "Walk 🐕",
        "Eating 🍽️",
        "Snooze 💤",
        "Play 🎾",
        "Bath 🛁",
        "Check-up 🩺",
        "Toilet 💩",
        "Other"
    ]
    
    let moodOptions = [
        "Excited/playful 🕺",
        "Happy 😊",
        "Loving 😍",
        "Calm 😌",
        "Curious 🤔",
        "Hungry 🍗",
        "Tired 😴",
        "bored/lazy 🙄",
        "Sick 🤢",
        "Sad 😢",
        "Scared 😨",
        "Angry 😡"
    ]
    
    private var isFormValid: Bool {
        !descriptionText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty &&
        !selectedActivity.isEmpty &&
        !selectedMood.isEmpty
    }
    
    var body: some View {
        VStack(spacing: 0) {
            // Header
            NavigationHeader(title: "Add update") {
                presentationMode.wrappedValue.dismiss()
            }
            
            // Content
            VStack(spacing: 32) {
                VStack(spacing: 20) {
                    Text("Step 2/2")
                        .font(.h4)
                        .foregroundColor(Color.brandPrimary)
                    
                    VStack(spacing: 8) {
                        Text("Add a description")
                            .font(.custom("Fredoka-SemiBold", size: 20))
                            .foregroundColor(Color.text1)
                        
                        Text("Describe what your pet was doing in the photo")
                            .font(.body1)
                            .foregroundColor(Color.text1)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 20)
                    }
                }
                
                // Pet Image
                Image(uiImage: selectedImage)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 120, height: 120)
                    .clipped()
                    .cornerRadius(8)
                
                // Form Fields
                VStack(spacing: 20) {
                    // Description Field
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Description")
                            .textStyle(TextStyles.H5())
                        
                        VStack {
                            ZStack(alignment: .topLeading) {
                                if descriptionText.isEmpty {
                                    Text("Write a description")
                                        .font(.body1)
                                        .foregroundColor(Color.text2.opacity(0.6))
                                        .padding(.horizontal, 20)
                                        .padding(.vertical, 20)
                                        .allowsHitTesting(false)
                                }
                                
                                TextEditor(text: $descriptionText)
                                    .font(.body1)
                                    .foregroundColor(Color.text1)
                                    .padding(.horizontal, 16)
                                    .padding(.vertical, 16)
                                    .scrollContentBackground(.hidden)
                                    .background(Color.clear)
                            }
                        }
                        .frame(height: 120)
                        .background(Color.white)
                        .cornerRadius(8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.borderPrimary, lineWidth: 1)
                        )
                        .clipped()
                    }
                    
                    // Activity Field
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Activity")
                            .textStyle(TextStyles.H5())
                        
                        Button(action: {
                            print("Activity button tapped")
                            activeSheet = .activity
                        }) {
                            HStack {
                                Text(selectedActivity.isEmpty ? "Select activity" : selectedActivity)
                                    .font(.body1)
                                    .foregroundColor(selectedActivity.isEmpty ? Color.text2 : Color.text1)
                                
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
                    }
                    
                    // Mood Field
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Mood")
                            .textStyle(TextStyles.H5())
                        
                        Button(action: {
                            activeSheet = .mood
                        }) {
                            HStack {
                                Text(selectedMood.isEmpty ? "Select mood" : selectedMood)
                                    .font(.body1)
                                    .foregroundColor(selectedMood.isEmpty ? Color.text2 : Color.text1)
                                
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
                    }
                }
                
                Spacer()
            }
            .padding(.horizontal, 20)
            
            // Submit Button
            VStack {
                PrimaryButton(
                    title: "Submit",
                    isEnabled: isFormValid
                ) {
                    // Navigate back to PetProfileView (dismiss both AddUpdateDetailsView and AddUpdatePhotoView)
                    presentationMode.wrappedValue.dismiss()
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                        presentationMode.wrappedValue.dismiss()
                    }
                }
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 20)
        }
        .background(Color.white)
        .navigationBarHidden(true)
        .sheet(item: $activeSheet) { sheet in
            switch sheet {
            case .activity:
                VStack {
                    Text("Select Activity")
                        .font(.headline)
                        .padding()
                    
                    List(activityOptions, id: \.self) { activity in
                        Button(activity) {
                            selectedActivity = activity
                            activeSheet = nil
                        }
                        .foregroundColor(.primary)
                    }
                    
                    Button("Cancel") {
                        activeSheet = nil
                    }
                    .padding()
                }
                .presentationDetents([.medium])
                
            case .mood:
                VStack {
                    Text("Select Mood")
                        .font(.headline)
                        .padding()
                    
                    List(moodOptions, id: \.self) { mood in
                        Button(mood) {
                            selectedMood = mood
                            activeSheet = nil
                        }
                        .foregroundColor(.primary)
                    }
                    
                    Button("Cancel") {
                        activeSheet = nil
                    }
                    .padding()
                }
                .presentationDetents([.medium])
            }
        }
    }
}

#Preview {
    AddUpdateDetailsView(
        pet: GamePet(
            name: "Luna",
            breed: "Jindo",
            type: .water,
            level: 20,
            hp: 71,
            attack: 52,
            defense: 38,
            speed: 84
        ),
        selectedImage: UIImage(systemName: "photo")!
    )
}