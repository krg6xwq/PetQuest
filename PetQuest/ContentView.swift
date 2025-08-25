//
//  ContentView.swift
//  PetQuest
//
//  Created by kurt on 24/8/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            MyCollectionView()
                .navigationBarHidden(true)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

#Preview {
    ContentView()
}
