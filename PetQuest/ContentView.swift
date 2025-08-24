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
            VStack(spacing: 20) {
                Text("🐾 PetQuest")
                    .textStyle(TextStyles.H1())
                    .foregroundColor(.brandPrimary)
                    .padding(.top)
                
                Text("Discover your perfect companion")
                    .textStyle(TextStyles.Body1())
                    .foregroundColor(.text2)
                
                if petViewModel.availablePets.isEmpty {
                    VStack(spacing: 16) {
                        Image(systemName: "pawprint.circle")
                            .font(.system(size: 60))
                            .foregroundColor(.textInactive)
                        Text("No pets yet!")
                            .textStyle(TextStyles.H3())
                            .foregroundColor(.text1)
                        Text("Add your first pet to get started")
                            .textStyle(TextStyles.Body2())
                            .foregroundColor(.text2)
                    }
                    .padding()
                    .background(Color.bgTertiary)
                    .cornerRadius(12)
                    .padding(.horizontal)
                } else {
                    List(petViewModel.availablePets) { pet in
                        PetRowView(pet: pet, viewModel: petViewModel)
                            .listRowBackground(Color.bgSecondary)
                    }
                    .background(Color.bgTertiary)
                    .scrollContentBackground(.hidden)
                }
                
                Spacer()
            }
            .background(Color.bgSecondary)
            .navigationTitle("My Pets")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ContentView()
}
