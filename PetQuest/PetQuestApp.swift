//
//  PetQuestApp.swift
//  PetQuest
//
//  Created by kurt on 24/8/25.
//

import SwiftUI

@main
struct PetQuestApp: App {
    @StateObject private var petStore = PetStore()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(petStore)
        }
    }
}
