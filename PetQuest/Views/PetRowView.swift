import SwiftUI

struct PetRowView: View {
    let pet: Pet
    @ObservedObject var viewModel: PetViewModel
    
    var body: some View {
        HStack {
            Text(pet.type.emoji)
                .font(.title)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(pet.name)
                    .font(.headline)
                    .fontWeight(.semibold)
                
                Text("\(pet.type.rawValue) • \(pet.age) year\(pet.age == 1 ? "" : "s") old")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                Text(pet.description)
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .lineLimit(2)
            }
            
            Spacer()
            
            Button(action: {
                viewModel.adoptPet(pet)
            }) {
                Text("Adopt")
                    .font(.caption)
                    .fontWeight(.semibold)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 6)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
        }
        .padding(.vertical, 4)
    }
}

#Preview {
    PetRowView(
        pet: Pet(name: "Buddy", type: .dog, age: 3, description: "Friendly golden retriever looking for a loving home."),
        viewModel: PetViewModel()
    )
}