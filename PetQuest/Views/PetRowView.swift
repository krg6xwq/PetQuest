import SwiftUI

struct PetRowView: View {
    let pet: Pet
    @ObservedObject var viewModel: PetViewModel
    
    var body: some View {
        HStack(spacing: 12) {
            Text(pet.type.emoji)
                .font(.title)
            
            VStack(alignment: .leading, spacing: 6) {
                Text(pet.name)
                    .textStyle(TextStyles.H5())
                    .foregroundColor(.text1)
                
                Text("\(pet.type.rawValue) • \(pet.age) year\(pet.age == 1 ? "" : "s") old")
                    .textStyle(TextStyles.Body2())
                    .foregroundColor(.text2)
                
                Text(pet.description)
                    .textStyle(TextStyles.Caption())
                    .foregroundColor(.text2)
                    .lineLimit(2)
            }
            
            Spacer()
            
            Button(action: {
                viewModel.adoptPet(pet)
            }) {
                Text("Level Up")
                    .textStyle(TextStyles.Caption())
                    .foregroundColor(.bgSecondary)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 8)
                    .background(Color.brandPrimary)
                    .cornerRadius(8)
            }
        }
        .padding(.vertical, 8)
        .padding(.horizontal, 4)
    }
}

#Preview {
    PetRowView(
        pet: Pet(name: "Buddy", type: .dog, age: 3, description: "Friendly golden retriever looking for a loving home."),
        viewModel: PetViewModel()
    )
}