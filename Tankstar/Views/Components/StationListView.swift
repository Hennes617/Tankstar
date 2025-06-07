import SwiftUI

struct StationListView: View {
    let stations: [GasStation]
    let selectedFuelType: FuelType
    let onStationTap: (GasStation) -> Void
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 12) {
                ForEach(stations) { station in
                    StationCard(station: station, selectedFuelType: selectedFuelType)
                        .onTapGesture {
                            onStationTap(station)
                        }
                        .padding(.horizontal)
                }
            }
            .padding(.vertical)
        }
    }
}
