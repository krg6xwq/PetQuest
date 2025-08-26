import SwiftUI

struct SearchBar: View {
    @Binding var searchText: String
    let placeholder: String
    
    init(searchText: Binding<String>, placeholder: String = "Search") {
        self._searchText = searchText
        self.placeholder = placeholder
    }
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(Color.text2)
            
            TextField(placeholder, text: $searchText)
                .font(.h5)
                .foregroundColor(Color.text1)
        }
        .frame(height: 48)
        .padding(.horizontal, 20)
        .background(Color.white)
        .cornerRadius(8)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.borderPrimary, lineWidth: 1)
        )
    }
}

#Preview {
    VStack(spacing: 16) {
        SearchBar(searchText: .constant(""), placeholder: "Search")
        SearchBar(searchText: .constant("Roxie"), placeholder: "Search pets")
        SearchBar(searchText: .constant(""), placeholder: "Search updates")
    }
    .padding()
    .background(Color.bgTertiary)
}