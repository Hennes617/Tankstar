import Foundation
import CoreLocation

struct GasStation: Identifiable {
    let id: String
    let name: String
    let brand: String
    let street: String
    let place: String
    let distance: Double
    let isOpen: Bool
    let prices: [FuelType: Double?]
    let coordinate: CLLocationCoordinate2D
    let houseNumber: String
    let postCode: Int
    
    init(from apiStation: APIStation) {
        self.id = apiStation.id
        self.name = apiStation.name
        self.brand = apiStation.brand
        self.street = apiStation.street
        self.place = apiStation.place
        self.distance = apiStation.dist
        self.isOpen = apiStation.isOpen
        self.prices = [
            .e5: apiStation.e5,
            .e10: apiStation.e10,
            .diesel: apiStation.diesel
        ]
        self.coordinate = CLLocationCoordinate2D(latitude: apiStation.lat, longitude: apiStation.lng)
        self.houseNumber = apiStation.houseNumber
        self.postCode = apiStation.postCode
    }
    
    var fullAddress: String {
        "\(street) \(houseNumber), \(postCode) \(place)"
    }
}
