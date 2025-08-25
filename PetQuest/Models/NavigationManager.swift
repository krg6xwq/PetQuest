import SwiftUI

class NavigationManager: ObservableObject {
    @Published var isAddPetFlowActive = false
    
    func startAddPetFlow() {
        isAddPetFlowActive = true
    }
    
    func finishAddPetFlow() {
        isAddPetFlowActive = false
    }
}