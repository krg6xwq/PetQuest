//
//  ContentView.swift
//  PetQuest
//
//  Created by kurt on 24/8/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var petViewModel = PetViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                Text("🐾 PetQuest")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.top)
                
                if petViewModel.availablePets.isEmpty {
                    VStack {
                        Image(systemName: "pawprint.circle")
                            .font(.system(size: 60))
                            .foregroundColor(.gray)
                        Text("No pets available for adoption")
                            .font(.title2)
                            .foregroundColor(.gray)
                    }
                    .padding()
                } else {
                    List(petViewModel.availablePets) { pet in
                        PetRowView(pet: pet, viewModel: petViewModel)
                    }
                }
                
                Spacer()
            }
            .navigationTitle("Available Pets")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ContentView()
}
