import SwiftUI

enum SortOption: String, CaseIterable {
    case name = "Name"
    case level = "Level"
    case breed = "Breed" 
    case type = "Type"
    case dateCollected = "Date collected"
    case lastUpdated = "Last updated"
}

struct FilterOptionsView: View {
    @Binding var isPresented: Bool
    @State private var selectedSortBy: SortOption
    @State private var selectedType: GamePetType?
    @State private var selectedBreed: String
    @State private var levelRange: ClosedRange<Double>
    @State private var showingSortPicker = false
    @State private var showingTypePicker = false
    @State private var showingBreedPicker = false
    
    // Original values to track changes
    private let originalSortBy: SortOption
    private let originalType: GamePetType?
    private let originalBreed: String
    private let originalLevelRange: ClosedRange<Double>
    
    let breeds = ["Jindo", "Border Collie", "Bordoodle", "Pomeranian", "German Shepherd", "Golden Retriever", "Labrador", "Bulldog"]
    
    var onApplyFilters: (SortOption, GamePetType?, String, ClosedRange<Double>) -> Void
    
    init(
        isPresented: Binding<Bool>,
        currentSortBy: SortOption = .level,
        currentType: GamePetType? = nil,
        currentBreed: String = "",
        currentLevelRange: ClosedRange<Double> = 1...99,
        onApplyFilters: @escaping (SortOption, GamePetType?, String, ClosedRange<Double>) -> Void
    ) {
        self._isPresented = isPresented
        self._selectedSortBy = State(initialValue: currentSortBy)
        self._selectedType = State(initialValue: currentType)
        self._selectedBreed = State(initialValue: currentBreed)
        self._levelRange = State(initialValue: currentLevelRange)
        self.originalSortBy = currentSortBy
        self.originalType = currentType
        self.originalBreed = currentBreed
        self.originalLevelRange = currentLevelRange
        self.onApplyFilters = onApplyFilters
    }
    
    var hasChanges: Bool {
        selectedSortBy != originalSortBy ||
        selectedType != originalType ||
        selectedBreed != originalBreed ||
        levelRange != originalLevelRange
    }
    
    var body: some View {
        VStack(spacing: 0) {
            // Header
            HStack {
                Text("Filters")
                    .textStyle(TextStyles.H2())
                    .foregroundColor(Color.text1)
                
                Spacer()
                
                Button("Reset") {
                    selectedSortBy = .level
                    selectedType = nil
                    selectedBreed = ""
                    levelRange = 1...99
                }
                .font(.custom("Fredoka-Medium", size: 18))
                .foregroundColor(Color.brandPrimary)
            }
            .padding(.horizontal, 20)
            .padding(.top, 20)
            
            // Filter Options
            VStack(spacing: 20) {
                // Sort by
                VStack(alignment: .leading, spacing: 8) {
                    Text("Sort by")
                        .font(.custom("Fredoka-Medium", size: 16))
                        .foregroundColor(Color.text1)
                    
                    Button(action: {
                        showingSortPicker = true
                    }) {
                        HStack {
                            Text(selectedSortBy.rawValue)
                                .font(.body1)
                                .foregroundColor(Color.text1)
                            
                            Spacer()
                            
                            Image(systemName: "chevron.down")
                                .font(.system(size: 12, weight: .medium))
                                .foregroundColor(Color.text2)
                        }
                        .padding(.horizontal, 20)
                        .padding(.vertical, 12)
                        .frame(height: 48)
                        .background(Color.white)
                        .cornerRadius(8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.borderPrimary, lineWidth: 1)
                        )
                    }
                    .buttonStyle(PlainButtonStyle())
                }
                
                // Type
                VStack(alignment: .leading, spacing: 8) {
                    Text("Type")
                        .font(.custom("Fredoka-Medium", size: 16))
                        .foregroundColor(Color.text1)
                    
                    Button(action: {
                        showingTypePicker = true
                    }) {
                        HStack {
                            Text(selectedType?.rawValue.capitalized ?? "Select")
                                .font(.body1)
                                .foregroundColor(selectedType != nil ? Color.text1 : Color.borderPrimary)
                            
                            Spacer()
                            
                            Image(systemName: "chevron.down")
                                .font(.system(size: 12, weight: .medium))
                                .foregroundColor(Color.text2)
                        }
                        .padding(.horizontal, 20)
                        .padding(.vertical, 12)
                        .frame(height: 48)
                        .background(Color.white)
                        .cornerRadius(8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.borderPrimary, lineWidth: 1)
                        )
                    }
                    .buttonStyle(PlainButtonStyle())
                }
                
                // Breed
                VStack(alignment: .leading, spacing: 8) {
                    Text("Breed")
                        .font(.custom("Fredoka-Medium", size: 16))
                        .foregroundColor(Color.text1)
                    
                    Button(action: {
                        showingBreedPicker = true
                    }) {
                        HStack {
                            Text(selectedBreed.isEmpty ? "Select" : selectedBreed)
                                .font(.body1)
                                .foregroundColor(selectedBreed.isEmpty ? Color.borderPrimary : Color.text1)
                            
                            Spacer()
                            
                            Image(systemName: "chevron.down")
                                .font(.system(size: 12, weight: .medium))
                                .foregroundColor(Color.text2)
                        }
                        .padding(.horizontal, 20)
                        .padding(.vertical, 12)
                        .frame(height: 48)
                        .background(Color.white)
                        .cornerRadius(8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.borderPrimary, lineWidth: 1)
                        )
                    }
                    .buttonStyle(PlainButtonStyle())
                }
                
                // Level Range
                VStack(alignment: .leading, spacing: 12) {
                    HStack {
                        Text("Level range")
                            .font(.custom("Fredoka-Medium", size: 16))
                            .foregroundColor(Color.text1)
                        
                        Spacer()
                        
                        Text("\(Int(levelRange.lowerBound))-\(Int(levelRange.upperBound))")
                            .font(.body1)
                            .foregroundColor(Color.text1)
                    }
                    
                    RangeSlider(
                        range: $levelRange,
                        bounds: 1...99,
                        step: 1
                    )
                }
            }
            .padding(.horizontal, 20)
            .padding(.top, 40)
            
            Spacer()
            
            // Apply Button
            PrimaryButton(
                title: "Apply",
                isEnabled: hasChanges
            ) {
                onApplyFilters(selectedSortBy, selectedType, selectedBreed, levelRange)
                isPresented = false
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 32)
        }
        .background(Color.white)
        .cornerRadius(16, corners: [.topLeft, .topRight])
        .shadow(color: Color.black.opacity(0.25), radius: 5, x: 0, y: 0)
        .ignoresSafeArea(.container, edges: .bottom)
        .sheet(isPresented: $showingSortPicker) {
            NavigationView {
                List(SortOption.allCases, id: \.self) { option in
                    Button(option.rawValue) {
                        selectedSortBy = option
                        showingSortPicker = false
                    }
                    .foregroundColor(.primary)
                }
                .navigationTitle("Sort by")
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarItems(
                    trailing: Button("Cancel") {
                        showingSortPicker = false
                    }
                )
            }
            .presentationDetents([.medium])
        }
        .sheet(isPresented: $showingTypePicker) {
            NavigationView {
                List {
                    Button("All Types") {
                        selectedType = nil
                        showingTypePicker = false
                    }
                    .foregroundColor(.primary)
                    
                    ForEach(GamePetType.allCases, id: \.self) { type in
                        Button(action: {
                            selectedType = type
                            showingTypePicker = false
                        }) {
                            HStack(spacing: 8) {
                                Text(type.rawValue.capitalized)
                                    .foregroundColor(.primary)

                                Image(systemName: Color.petTypeIcon(type.rawValue))
                                    .font(.system(size: 16))
                                    .foregroundColor(Color.petType(type.rawValue))
                            }
                        }
                    }
                }
                .navigationTitle("Pet Type")
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarItems(
                    trailing: Button("Cancel") {
                        showingTypePicker = false
                    }
                )
            }
            .presentationDetents([.medium])
        }
        .sheet(isPresented: $showingBreedPicker) {
            NavigationView {
                List {
                    Button("All Breeds") {
                        selectedBreed = ""
                        showingBreedPicker = false
                    }
                    .foregroundColor(.primary)
                    
                    ForEach(breeds, id: \.self) { breed in
                        Button(breed) {
                            selectedBreed = breed
                            showingBreedPicker = false
                        }
                        .foregroundColor(.primary)
                    }
                }
                .navigationTitle("Breed")
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarItems(
                    trailing: Button("Cancel") {
                        showingBreedPicker = false
                    }
                )
            }
            .presentationDetents([.medium])
        }
    }
}


#Preview {
    FilterOptionsView(
        isPresented: .constant(true),
        currentSortBy: .name,
        currentType: .fire,
        currentBreed: "Jindo",
        currentLevelRange: 10...50,
        onApplyFilters: { sortBy, type, breed, range in
            print("Applied filters: \(sortBy), \(type?.rawValue ?? "All"), \(breed.isEmpty ? "All" : breed), \(range)")
        }
    )
}