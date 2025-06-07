import Foundation

struct TankstellenResponse: Codable {
    let ok: Bool
    let status: String
    let stations: [APIStation]
}

struct APIStation: Codable {
    let id: String
    let name: String
    let brand: String
    let street: String
    let place: String
    let lat: Double
    let lng: Double
    let dist: Double
    let diesel: Double?
    let e5: Double?
    let e10: Double?
    let isOpen: Bool
    let houseNumber: String
    let postCode: Int
}

struct DetailResponse: Codable {
    let ok: Bool
    let status: String
    let station: DetailStation
}

struct DetailStation: Codable {
    let id: String
    let name: String
    let brand: String
    let street: String
    let houseNumber: String
    let postCode: Int
    let place: String
    let openingTimes: [OpeningTime]
    let overrides: [String]
    let wholeDay: Bool
    let isOpen: Bool
    let e5: Double?
    let e10: Double?
    let diesel: Double?
    let lat: Double
    let lng: Double
    let state: String?
}

struct OpeningTime: Codable {
    let text: String
    let start: String
    let end: String
}
