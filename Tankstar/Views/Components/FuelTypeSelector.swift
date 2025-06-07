import SwiftUI

struct FuelTypeSelector: View {
    @Binding var selectedFuelType: FuelType
    
    var body: some View {
        HStack(spacing: 16) {
            ForEach(FuelType.allCases, id: \.self) { type in
                FuelTypeButton(type: type, isSelected: type == selectedFuelType) {
                    selectedFuelType = type
                }
            }
        }
    }
}
