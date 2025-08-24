import Foundation

struct Pet: Identifiable, Codable {
    let id = UUID()
    var name: String
    var type: PetType
    var age: Int
    var description: String
    var isAdopted: Bool = false
    
    init(name: String, type: PetType, age: Int, description: String) {
        self.name = name
        self.type = type
        self.age = age
        self.description = description
    }
}

enum PetType: String, CaseIterable, Codable {
    case dog = "Dog"
    case cat = "Cat"
    case rabbit = "Rabbit"
    case bird = "Bird"
    case fish = "Fish"
    case hamster = "Hamster"
    
    var emoji: String {
        switch self {
        case .dog: return "🐕"
        case .cat: return "🐱"
        case .rabbit: return "🐰"
        case .bird: return "🐦"
        case .fish: return "🐠"
        case .hamster: return "🐹"
        }
    }
}