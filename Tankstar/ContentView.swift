
import SwiftUI

struct ContentView: View {
    @StateObject private var api = TankstellenAPI()
    @StateObject private var locationManager = LocationManager()
    @State private var selectedFuelType: FuelType = .e5
    @State private var selectedStation: GasStation?
    @State private var searchRadius: Double = 5
    @State private var showSettings = false
    @AppStorage("preferredFuelType") private var savedFuelType: String = FuelType.e5.rawValue
    
    var body: some View {
        NavigationView {
            ZStack {
                AnimatedBackground()
                
                VStack(spacing: 0) {
                    // Header
                    VStack(alignment: .leading, spacing: 16) {
                        HStack {
                            Text("Tankpreise")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                            
                            Spacer()
                            
                            Button(action: { showSettings = true }) {
                                Image(systemName: "slider.horizontal.3")
                                    .font(.title2)
                                    .foregroundColor(.white)
                            }
                        }
                        
                        FuelTypeSelector(selectedFuelType: $selectedFuelType)
                    }
                    .padding()
                    
                    // Content
                    if locationManager.authorizationStatus == .denied {
                        LocationPermissionView()
                    } else if api.isLoading {
                        LoadingView()
                    } else if let error = api.error {
                        ErrorView(error: error) {
                            loadStations()
                        }
                    } else if api.stations.isEmpty {
                        EmptyStateView()
                    } else {
                        StationListView(
                            stations: api.stations,
                            selectedFuelType: selectedFuelType,
                            onStationTap: { station in
                                selectedStation = station
                            }
                        )
                    }
                }
            }
            .navigationBarHidden(true)
            .onAppear {
                loadStations()
            }
            .sheet(item: $selectedStation) { station in
                StationDetailView(station: station, selectedFuelType: selectedFuelType)
            }
            .sheet(isPresented: $showSettings) {
                SettingsView(searchRadius: $searchRadius, onRadiusChange: {
                    loadStations()
                })
            }
        }
    }
    
    private func loadStations() {
        if let location = locationManager.location {
            api.fetchNearbyStations(
                latitude: location.latitude,
                longitude: location.longitude,
                radius: searchRadius
            )
        }
    }
}
