import SwiftUI

struct LocationPermissionView: View {
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "location.slash")
                .font(.system(size: 50))
                .foregroundColor(.red)
            Text("Standortzugriff erforderlich")
                .font(.title)
                .bold()
            Text("Bitte erlaube der App den Zugriff auf deinen Standort in den iOS-Einstellungen, um Tankstellen in deiner Nähe anzuzeigen.")
                .multilineTextAlignment(.center)
                .foregroundColor(.secondary)
                .padding(.horizontal)
        }
        .padding()
    }
}
