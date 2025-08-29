import SwiftUI

struct ViewUpdateView: View {
    let update: PetUpdate
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack(spacing: 0) {
            // Header
            NavigationHeader(title: "View update") {
                presentationMode.wrappedValue.dismiss()
            }
            
            // Main Content
            VStack(spacing: 24) {
                // Pet Name and Date
                VStack(spacing: 4) {
                    Text("\(update.petName) (\(update.petBreed))")
                        .font(.custom("Fredoka-SemiBold", size: 20))
                        .foregroundColor(Color.text1)
                    
                    Text(update.timestamp)
                        .font(.body1)
                        .foregroundColor(Color.text1)
                }
                
                // Update Image
                if let image = update.image {
                    Image(uiImage: image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(maxWidth: .infinity)
                        .aspectRatio(1, contentMode: .fit)
                        .clipped()
                        .cornerRadius(16)
                } else {
                    Image("dog-walk")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(maxWidth: .infinity)
                        .aspectRatio(1, contentMode: .fit)
                        .clipped()
                        .cornerRadius(16)
                }
                
                // Tags and XP Section
                VStack(spacing: 12) {
                    HStack {
                        // Tags
                        HStack(spacing: 4) {
                            ForEach(update.tags, id: \.self) { tag in
                                Text(tag)
                                    .font(.body1)
                                    .foregroundColor(Color.text2)
                                    .padding(.horizontal, 12)
                                    .padding(.vertical, 4)
                                    .background(Color.white)
                                    .cornerRadius(20)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 20)
                                            .stroke(Color.borderPrimary, lineWidth: 1)
                                    )
                            }
                        }
                        
                        Spacer()
                        
                        // XP
                        Text("+\(update.xpGained) XP")
                            .font(.body1)
                            .foregroundColor(Color.brandPrimary)
                    }
                    
                    // Description
                    VStack(alignment: .leading) {
                        Text(update.description)
                            .font(.body1)
                            .foregroundColor(Color.text1)
                            .lineLimit(nil)
                            .multilineTextAlignment(.leading)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(12)
                            .background(Color.bgTertiary)
                            .cornerRadius(8)
                    }
                }
                
                Spacer()
            }
            .padding(.horizontal, 20)
            .padding(.top, 20)
            .background(Color.white)
        }
        .navigationBarHidden(true)
    }
}

#Preview {
    ViewUpdateView(update: PetUpdate(
        petName: "Roxie",
        petBreed: "Jindo",
        timestamp: "24 Jul 2025 - 5:31pm",
        image: nil,
        tags: ["Walk 🦮", "Happy 😁"],
        xpGained: 25,
        description: "Luna went for a walk and played with the other dogs and jumped into the pool. Luna went for a walk and played with the other dogs and jumped into the pool. Luna went for a walk and played with the other dogs and jumped into the pool. Luna went for a walk and played with the other dogs and jumped into the pool. Luna went for a walk and played with the other dogs and jumped into the pool. Luna went for a walk and"
    ))
}