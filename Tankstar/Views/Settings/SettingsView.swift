import SwiftUI

struct SettingsView: View {
    @Binding var searchRadius: Double
    let onRadiusChange: () -> Void
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Suchradius (km)")) {
                    Slider(value: $searchRadius, in: 1...20, step: 1) {
                        Text("Radius")
                    }
                    Text("\(Int(searchRadius)) km")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
            }
            .navigationTitle("Einstellungen")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Fertig") {
                        onRadiusChange()
                        dismiss()
                    }
                }
            }
        }
    }
}
