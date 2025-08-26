import SwiftUI

struct BottomTabBar: View {
    @Binding var selectedTab: TabItem
    
    var body: some View {
        VStack(spacing: 0) {
            Rectangle()
                .fill(Color.borderPrimary)
                .frame(height: 1)
            
            HStack {
                TabBarItemView(
                    tab: .home,
                    selectedTab: $selectedTab
                )
                
                TabBarItemView(
                    tab: .battle,
                    selectedTab: $selectedTab
                )
                
                TabBarItemView(
                    tab: .collection,
                    selectedTab: $selectedTab
                )
            }
            .padding(.horizontal, 40)
            .padding(.vertical, 12)
            .background(Color.white)
            .frame(height: 80)
        }
    }
}

struct TabBarItemView: View {
    let tab: TabItem
    @Binding var selectedTab: TabItem
    
    var body: some View {
        Button(action: {
            selectedTab = tab
        }) {
            VStack(spacing: 4) {
                Image(systemName: tab.icon)
                    .font(.system(size: 24))
                    .foregroundColor(selectedTab == tab ? Color.brandPrimary : Color.borderPrimary)
                
                Text(tab.label)
                    .textStyle(TextStyles.Caption())
            }
            .frame(maxWidth: .infinity)
        }
        .buttonStyle(PlainButtonStyle())
    }
}

enum TabItem: String, CaseIterable {
    case home = "home"
    case battle = "battle"
    case collection = "collection"
    
    var icon: String {
        switch self {
        case .home: return "house"
        case .battle: return "bolt"
        case .collection: return "folder"
        }
    }
    
    var label: String {
        switch self {
        case .home: return "Home"
        case .battle: return "Battle"
        case .collection: return "Collection"
        }
    }
}

#Preview {
    VStack {
        Spacer()
        BottomTabBar(selectedTab: .constant(.collection))
    }
    .background(Color.grey200)
}