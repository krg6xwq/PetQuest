import SwiftUI

struct EmptyStateView: View {
    let icon: String
    let title: String
    let message: String
    let actionTitle: String?
    let action: (() -> Void)?
    
    init(
        icon: String,
        title: String,
        message: String,
        actionTitle: String? = nil,
        action: (() -> Void)? = nil
    ) {
        self.icon = icon
        self.title = title
        self.message = message
        self.actionTitle = actionTitle
        self.action = action
    }
    
    var body: some View {
        VStack(spacing: 24) {
            VStack(spacing: 16) {
                // Icon
                ZStack {
                    Circle()
                        .fill(Color.bgTertiary)
                        .frame(width: 80, height: 80)
                    
                    Image(systemName: icon)
                        .font(.system(size: 36))
                        .foregroundColor(Color.text2)
                }
                
                // Text Content
                VStack(spacing: 8) {
                    Text(title)
                        .font(.custom("Fredoka-SemiBold", size: 20))
                        .foregroundColor(Color.text1)
                        .multilineTextAlignment(.center)
                    
                    Text(message)
                        .font(.body1)
                        .foregroundColor(Color.text2)
                        .multilineTextAlignment(.center)
                        .fixedSize(horizontal: false, vertical: true)
                        .lineLimit(3)
                }
            }
            
            // Optional Action Button
            if let actionTitle = actionTitle, let action = action {
                Button(action: action) {
                    Text(actionTitle)
                        .font(.h4)
                        .foregroundColor(Color.brandPrimary)
                        .padding(.horizontal, 24)
                        .padding(.vertical, 12)
                }
                .buttonStyle(PlainButtonStyle())
            }
        }
        .padding(.horizontal, 40)
        .frame(maxWidth: .infinity)
    }
}

// MARK: - Convenience Initializers for Common Empty States

extension EmptyStateView {
    // No pets in collection
    static func noPets(onAddPet: @escaping () -> Void) -> EmptyStateView {
        EmptyStateView(
            icon: "heart.slash",
            title: "No pets yet",
            message: "Start building your collection by adding your first pet!",
            actionTitle: "Add Pet",
            action: onAddPet
        )
    }
    
    // No search results
    static func noSearchResults(searchTerm: String, onClearSearch: @escaping () -> Void) -> EmptyStateView {
        EmptyStateView(
            icon: "magnifyingglass",
            title: "No results found",
            message: "We couldn't find any pets matching '\(searchTerm)'. Try a different search term.",
            actionTitle: "Clear Search",
            action: onClearSearch
        )
    }
    
    // No filter results
    static func noFilterResults(onClearFilters: @escaping () -> Void) -> EmptyStateView {
        EmptyStateView(
            icon: "questionmark",
            title: "No matching pets",
            message: "No pets match your current filters. Try adjusting your search criteria.",
            actionTitle: "Clear Filters",
            action: onClearFilters
        )
    }
    
    // No updates
    static func noUpdates() -> EmptyStateView {
        EmptyStateView(
            icon: "photo.on.rectangle.angled",
            title: "No updates yet",
            message: "Start sharing moments with your pet by adding your first update!"
        )
    }
}

#Preview {
    VStack(spacing: 60) {
        EmptyStateView.noPets {
            print("Add pet tapped")
        }
        
        EmptyStateView.noSearchResults(searchTerm: "Golden") {
            print("Clear search tapped")
        }
        
        EmptyStateView.noFilterResults {
            print("Clear filters tapped")
        }
    }
    .padding()
    .background(Color.white)
}