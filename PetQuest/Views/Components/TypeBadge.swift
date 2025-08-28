import SwiftUI

struct TypeBadge: View {
    let type: GamePetType
    
    var body: some View {
        HStack(spacing: 4) {
            Image(systemName: Color.petTypeIcon(type.rawValue))
                .font(.system(size: 16))
                .foregroundColor(Color.petType(type.rawValue))
            
            Text(type.rawValue.capitalized)
                .font(.h6)
                .foregroundColor(Color.petType(type.rawValue))
        }
        .padding(.horizontal, 6)
        .padding(.vertical, 2)
        .background(Color.petTypeBadgeBackground(type.rawValue))
        .cornerRadius(10)
    }
}

#Preview {
    VStack(spacing: 8) {
        TypeBadge(type: .fire)
        TypeBadge(type: .water)
        TypeBadge(type: .earth)
        TypeBadge(type: .air)
        TypeBadge(type: .lightning)
        TypeBadge(type: .frost)
        TypeBadge(type: .shadow)
        TypeBadge(type: .grass)
    }
    .padding()
}