import SwiftUI

enum FuelType: String, CaseIterable {
    case e5 = "Super E5"
    case e10 = "Super E10"
    case diesel = "Diesel"
    
    var icon: String {
        switch self {
        case .e5: return "bolt.fill"
        case .e10: return "leaf.fill"
        case .diesel: return "drop.fill"
        }
    }
    
    var gradientColors: [Color] {
        switch self {
        case .e5: return [Color.orange, Color.red]
        case .e10: return [Color.green, Color.mint]
        case .diesel: return [Color.blue, Color.indigo]
        }
    }
    
    var apiKey: String {
        switch self {
        case .e5: return "e5"
        case .e10: return "e10"
        case .diesel: return "diesel"
        }
    }
}
