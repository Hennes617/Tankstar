import SwiftUI

struct StationCard: View {
    let station: GasStation
    let selectedFuelType: FuelType
    
    var priceText: String {
        if let price = station.prices[selectedFuelType] ?? nil {
            return String(format: "%.2f €", price)
        }
        return "N/A"
    }
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text(station.name)
                    .font(.headline)
                Text(station.fullAddress)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                Text(station.isOpen ? "Geöffnet" : "Geschlossen")
                    .font(.caption)
                    .foregroundColor(station.isOpen ? .green : .red)
            }
            Spacer()
            Text(priceText)
                .font(.title3)
                .fontWeight(.bold)
                .foregroundColor(selectedFuelType.gradientColors.first ?? .primary)
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 12).fill(Color(.systemBackground).opacity(0.8)))
        .shadow(radius: 2)
    }
}
