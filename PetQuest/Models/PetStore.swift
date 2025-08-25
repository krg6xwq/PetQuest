import SwiftUI

class PetStore: ObservableObject {
    @Published var pets: [GamePet] = [
        GamePet(name: "Roxie", breed: "Jindo", type: .fire, level: 22, hp: 71, attack: 52, defense: 38, speed: 84),
        GamePet(name: "Luna", breed: "Jindo", type: .water, level: 20, hp: 71, attack: 52, defense: 38, speed: 84),
        GamePet(name: "Kobo", breed: "Border Collie", type: .earth, level: 18, hp: 71, attack: 52, defense: 38, speed: 84),
        GamePet(name: "Bailey", breed: "Bordoodle", type: .air, level: 17, hp: 71, attack: 52, defense: 38, speed: 84),
        GamePet(name: "Fifi", breed: "Pomeranian", type: .lightning, level: 11, hp: 71, attack: 52, defense: 38, speed: 84),
        GamePet(name: "Titus", breed: "Border Collie", type: .frost, level: 97, hp: 71, attack: 52, defense: 38, speed: 84),
        GamePet(name: "Zeno", breed: "Border Collie", type: .shadow, level: 5, hp: 71, attack: 52, defense: 38, speed: 84),
        GamePet(name: "Troy", breed: "German Shepherd", type: .grass, level: 99, hp: 71, attack: 52, defense: 38, speed: 84)
    ]
    
    func addPet(_ pet: GamePet) {
        pets.append(pet)
    }
}