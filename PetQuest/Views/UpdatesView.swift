import SwiftUI

struct UpdatesView: View {
    @State private var searchText = ""
    
    // Mock data for updates
    let sampleUpdates: [PetUpdate] = [
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
            petName: "Bailey",
            petBreed: "Bordoodle",
            timestamp: "24 Jul 2025 - 3:22pm",
            image: nil,
            tags: ["Training 🎾", "Good 👍"],
            xpGained: 15,
            description: "Bailey learned a new trick today! Successfully mastered 'roll over' after practicing for 30 minutes. Very proud of the progress..."
        ),
        PetUpdate(
            petName: "Luna",
            petBreed: "Jindo",
            timestamp: "24 Jul 2025 - 1:45pm",
            image: nil,
            tags: ["Meal 🍖", "Healthy 💚"],
            xpGained: 10,
            description: "Had a nutritious lunch with premium kibble and some fresh vegetables. Luna ate everything and seemed really satisfied..."
        ),
        PetUpdate(
            petName: "Kobo",
            petBreed: "Border Collie",
            timestamp: "23 Jul 2025 - 6:12pm",
            image: nil,
            tags: ["Play 🎾", "Active 💪"],
            xpGained: 30,
            description: "Intense frisbee session at the park for over an hour. Kobo showed incredible agility and caught every throw perfectly..."
        ),
        PetUpdate(
            petName: "Fifi",
            petBreed: "Pomeranian",
            timestamp: "23 Jul 2025 - 4:33pm",
            image: nil,
            tags: ["Grooming ✂️", "Beautiful 💅"],
            xpGained: 20,
            description: "Professional grooming session today. Fifi got a full wash, nail trim, and styling. Looking absolutely gorgeous now..."
        ),
        PetUpdate(
            petName: "Titus",
            petBreed: "Border Collie",
            timestamp: "23 Jul 2025 - 2:18pm",
            image: nil,
            tags: ["Vet 🏥", "Healthy 💚"],
            xpGained: 5,
            description: "Regular checkup at the vet. All vitals are perfect and vaccinations are up to date. Clean bill of health for Titus..."
        )
    ]
    
    var body: some View {
        VStack(spacing: 24) {
                // Header with title and Add Update button
                HStack {
                    Text("Updates")
                        .textStyle(TextStyles.H1())
                    
                    Spacer()
                    
                    Button(action: {
                        // Add update action
                    }) {
                        HStack(spacing: 6) {
                            Image(systemName: "plus")
                                .font(.system(size: 16, weight: .medium))
                            
                            Text("Add update")
                                .font(.h4)
                        }
                        .foregroundColor(.white)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 8)
                        .background(Color.brandPrimary)
                        .cornerRadius(20)
                    }
                }
                
                // Search and Filter
                HStack(spacing: 12) {
                    SearchBar(searchText: $searchText, placeholder: "Search")
                    
                    FilterButton {
                        // Filter action
                    }
                }
                
                // All updates section
                VStack(alignment: .leading, spacing: 12) {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("All updates (\(sampleUpdates.count))")
                            .font(.h5)
                            .foregroundColor(Color.text2)
                        
                        Rectangle()
                            .fill(Color.borderPrimary)
                            .frame(height: 1)
                    }
                    
                    // Update Cards
                    ScrollView {
                        LazyVStack(spacing: 12) {
                            ForEach(sampleUpdates) { update in
                                UpdateCard(update: update)
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
    UpdatesView()
}