import SwiftUI

struct FuelTypeButton: View {
    let type: FuelType
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            VStack {
                Image(systemName: type.icon)
                    .font(.title)
                    .foregroundColor(isSelected ? .white : .gray)
                Text(type.rawValue)
                    .font(.caption)
                    .foregroundColor(isSelected ? .white : .gray)
            }
            .padding(10)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(LinearGradient(
                        colors: isSelected ? type.gradientColors : [.clear, .clear],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    ))
            )
        }
        .buttonStyle(PlainButtonStyle())
    }
}
