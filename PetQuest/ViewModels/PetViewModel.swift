import Foundation
import SwiftUI

@MainActor
class PetViewModel: ObservableObject {
    @Published var pets: [Pet] = []
    @Published var isLoading: Bool = false
    @Published var selectedPet: Pet?
    
    init() {
        loadSampleData()
    }
    
    func loadSampleData() {
        pets = [
            Pet(name: "Buddy", type: .dog, age: 3, description: "Friendly golden retriever looking for a loving home."),
            Pet(name: "Whiskers", type: .cat, age: 2, description: "Playful tabby cat who loves attention."),
            Pet(name: "Coco", type: .rabbit, age: 1, description: "Sweet bunny who enjoys carrots and cuddles."),
            Pet(name: "Charlie", type: .bird, age: 5, description: "Colorful parrot that loves to talk.")
        ]
    }
    
    func adoptPet(_ pet: Pet) {
        if let index = pets.firstIndex(where: { $0.id == pet.id }) {
            pets[index].isAdopted = true
        }
    }
    
    func addPet(_ pet: Pet) {
        pets.append(pet)
    }
    
    func removePet(_ pet: Pet) {
        pets.removeAll { $0.id == pet.id }
    }
    
    var availablePets: [Pet] {
        pets.filter { !$0.isAdopted }
    }
    
    var adoptedPets: [Pet] {
        pets.filter { $0.isAdopted }
    }
}