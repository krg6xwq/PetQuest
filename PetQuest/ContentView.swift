//
//  ContentView.swift
//  PetQuest
//
//  Created by kurt on 24/8/25.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab: TabItem = .home
    
    var body: some View {
        NavigationView {
            ZStack {
                // Content based on selected tab
                Group {
                    switch selectedTab {
                    case .home:
                        UpdatesView()
                    case .battle:
                        // Placeholder for Battle view
                        VStack {
                            Text("Battle")
                                .font(.largeTitle)
                            Text("Coming Soon")
                                .foregroundColor(.secondary)
                        }
                    case .collection:
                        MyCollectionView()
                    }
                }
                
                // Bottom Tab Bar overlay
                VStack {
                    Spacer()
                    BottomTabBar(selectedTab: $selectedTab)
                }
            }
            .navigationBarHidden(true)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

#Preview {
    ContentView()
}
