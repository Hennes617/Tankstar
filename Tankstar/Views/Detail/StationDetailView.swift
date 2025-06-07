import SwiftUI
import MapKit

struct StationDetailView: View {
    let station: GasStation
    let selectedFuelType: FuelType

    @Environment(\.dismiss) var dismiss

    @State private var region: MKCoordinateRegion

    init(station: GasStation, selectedFuelType: FuelType) {
        self.station = station
        self.selectedFuelType = selectedFuelType
        _region = State(initialValue: MKCoordinateRegion(
            center: station.coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        ))
    }

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    Text(station.name)
                        .font(.largeTitle)
                        .fontWeight(.bold)

                    Map(
                        position: .constant(.region(region)),
                        interactionModes: .all,
                       
                    ) {
                        Marker(coordinate: station.coordinate) {
                            Text(station.name)
                        }
                    }
                    .frame(height: 200)
                    .cornerRadius(12)

                    VStack(alignment: .leading, spacing: 8) {
                        Text("Adresse:")
                            .font(.headline)
                        Text(station.fullAddress)

                        Text("Kraftstoffpreis:")
                            .font(.headline)
                        if let price = station.prices[selectedFuelType] {
                            Text(String(format: "%.2f €", price!))
                                .font(.title2)
                                .foregroundColor(selectedFuelType.gradientColors.first)
                        } else {
                            Text("Preis nicht verfügbar")
                                .foregroundColor(.secondary)
                        }

                        Text("Status:")
                            .font(.headline)
                        Text(station.isOpen ? "Geöffnet" : "Geschlossen")
                            .foregroundColor(station.isOpen ? .green : .red)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()

                    Spacer()
                }
                .padding()
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Schließen") {
                        dismiss()
                    }
                }
            }
        }
    }
}
