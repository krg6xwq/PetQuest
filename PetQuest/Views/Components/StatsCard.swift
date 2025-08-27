import SwiftUI

struct StatsCardView: View {
    let hp: Int
    let attack: Int
    let defense: Int
    let speed: Int
    
    var body: some View {
        VStack(spacing: 4) {
            StatRow(label: "HP", value: hp, color: Color.attributeHP, maxValue: 100)
            StatRow(label: "Attack", value: attack, color: Color.attributeAttack, maxValue: 100)
            StatRow(label: "Defense", value: defense, color: Color.attributeDefense, maxValue: 100)
            StatRow(label: "Speed", value: speed, color: Color.attributeSpeed, maxValue: 100)
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 8)
        .background(Color.white)
        .cornerRadius(8)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.borderPrimary, lineWidth: 1)
        )
    }
}

struct StatRow: View {
    let label: String
    let value: Int
    let color: Color
    let maxValue: Int
    
    private var progress: CGFloat {
        CGFloat(value) / CGFloat(maxValue)
    }
    
    var body: some View {
        HStack(spacing: 8) {
            Text(label)
                .font(.body2)
                .foregroundColor(Color.text2)
                .frame(width: 60, alignment: .center)
            
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 4)
                        .fill(Color(red: 0.97, green: 0.97, blue: 0.97)) // Gray background
                        .frame(height: 8)
                    
                    RoundedRectangle(cornerRadius: 4)
                        .fill(color)
                        .frame(width: geometry.size.width * progress, height: 8)
                }
            }
            .frame(height: 8)
            
            Text("\(value)")
                .font(.body1)
                .foregroundColor(Color.text1)
                .frame(width: 20, alignment: .leading)
        }
    }
}

#Preview {
    VStack(spacing: 20) {
        StatsCardView(hp: 71, attack: 52, defense: 38, speed: 84)
        
        StatsCardView(hp: 95, attack: 88, defense: 65, speed: 72)
        
        VStack(spacing: 8) {
            StatRow(label: "HP", value: 71, color: Color.attributeHP, maxValue: 100)
            StatRow(label: "Attack", value: 52, color: Color.attributeAttack, maxValue: 100)
            StatRow(label: "Defense", value: 38, color: Color.attributeDefense, maxValue: 100)
            StatRow(label: "Speed", value: 84, color: Color.attributeSpeed, maxValue: 100)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(8)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.borderPrimary, lineWidth: 1)
        )
    }
    .padding()
    .background(Color.bgTertiary)
}