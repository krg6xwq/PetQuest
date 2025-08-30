import SwiftUI

struct ViewAllUpdatesView: View {
    let pet: GamePet
    @Environment(\.presentationMode) var presentationMode
    
    // Mock data for pet updates - in real app this would be filtered by pet
    let petUpdates: [PetUpdate] = [
        PetUpdate(
            petName: "Roxie",
            petBreed: "Jindo",
            timestamp: "24 Jul 2025 - 5:31pm",
            image: nil,
            tags: ["Walk 🦮", "Happy 😁"],
            xpGained: 25,
            description: "Luna went for a walk and played with the other dogs and jumped into the pool. Luna went for a walk and played with the other..."
        ),
        PetUpdate(
            petName: "Roxie",
            petBreed: "Jindo",
            timestamp: "24 Jul 2025 - 2:15pm",
            image: nil,
            tags: ["Training 🎾", "Good 👍"],
            xpGained: 15,
            description: "Bailey learned a new trick today! Successfully mastered 'roll over' after practicing for 30 minutes. Very proud of the progress..."
        ),
        PetUpdate(
            petName: "Roxie",
            petBreed: "Jindo",
            timestamp: "23 Jul 2025 - 6:45pm",
            image: nil,
            tags: ["Meal 🍖", "Healthy 💚"],
            xpGained: 10,
            description: "Had a nutritious lunch with premium kibble and some fresh vegetables. Luna ate everything and seemed really satisfied..."
        ),
        PetUpdate(
            petName: "Roxie",
            petBreed: "Jindo",
            timestamp: "23 Jul 2025 - 3:22pm",
            image: nil,
            tags: ["Play 🎾", "Active 💪"],
            xpGained: 30,
            description: "Intense frisbee session at the park for over an hour. Kobo showed incredible agility and caught every throw perfectly..."
        ),
        PetUpdate(
            petName: "Roxie",
            petBreed: "Jindo",
            timestamp: "22 Jul 2025 - 4:33pm",
            image: nil,
            tags: ["Grooming ✂️", "Beautiful 💅"],
            xpGained: 20,
            description: "Professional grooming session today. Fifi got a full wash, nail trim, and styling. Looking absolutely gorgeous now..."
        ),
        PetUpdate(
            petName: "Roxie",
            petBreed: "Jindo",
            timestamp: "22 Jul 2025 - 1:18pm",
            image: nil,
            tags: ["Vet 🏥", "Healthy 💚"],
            xpGained: 5,
            description: "Regular checkup at the vet. All vitals are perfect and vaccinations are up to date. Clean bill of health for Titus..."
        )
    ]
    
    var body: some View {
        VStack(spacing: 0) {
            // Header
            NavigationHeader(title: "Updates") {
                presentationMode.wrappedValue.dismiss()
            }
            
            // Main Content
            VStack(spacing: 20) {
                // Title
                Text("Updates of \(pet.name) (\(petUpdates.count))")
                    .textStyle(TextStyles.H3())
                
                // Updates List
                ScrollView {
                    LazyVStack(spacing: 12) {
                        ForEach(petUpdates) { update in
                            NavigationLink(destination: ViewUpdateView(update: update)) {
                                SimpleUpdateCard(update: update)
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                }
                
                Spacer()
            }
            .padding(.horizontal, 20)
            .padding(.top, 20)
            .background(Color.white)
        }
        .navigationBarHidden(true)
    }
}

#Preview {
    ViewAllUpdatesView(pet: GamePet(
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