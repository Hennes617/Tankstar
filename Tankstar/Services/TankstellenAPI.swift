import Foundation
import Combine

class TankstellenAPI: ObservableObject {
    @Published var stations: [GasStation] = []
    @Published var isLoading = false
    @Published var error: String?
    
    private let apiKey = "dbb0a1c4-77d9-e3cb-5b86-7d1ac786d465"
    private let baseURL = "https://creativecommons.tankerkoenig.de/json"
    private var cancellables = Set<AnyCancellable>()
    
    func fetchNearbyStations(latitude: Double, longitude: Double, radius: Double = 5) {
        isLoading = true
        error = nil
        
        let urlString = "\(baseURL)/list.php?lat=\(latitude)&lng=\(longitude)&rad=\(radius)&sort=dist&type=all&apikey=\(apiKey)"
        
        guard let url = URL(string: urlString) else {
            self.error = "Ungültige URL."
            self.isLoading = false
            return
        }
        
        URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { data, response -> Data in
                guard let httpResponse = response as? HTTPURLResponse,
                      200..<300 ~= httpResponse.statusCode else {
                    throw URLError(.badServerResponse)
                }
                return data
            }
            .decode(type: TankstellenResponse.self, decoder: JSONDecoder()) // Changed to TankstellenResponse
            .receive(on: DispatchQueue.main)
            .sink { completion in
                self.isLoading = false
                if case .failure(let error) = completion {
                    self.error = error.localizedDescription
                    self.stations = []
                }
            } receiveValue: { response in
                self.stations = response.stations.map { GasStation(from: $0) }
            }
            .store(in: &cancellables)
    }
}
