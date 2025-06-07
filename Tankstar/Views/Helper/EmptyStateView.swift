import SwiftUI

struct EmptyStateView: View {
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "fuelpump.fill")
                .font(.system(size: 50))
                .foregroundColor(.gray)
            Text("Keine Tankstellen gefunden")
                .font(.title3)
                .foregroundColor(.secondary)
            Text("Versuche es später erneut oder überprüfe deine Standort-Einstellungen.")
                .font(.caption)
                .multilineTextAlignment(.center)
                .foregroundColor(.secondary)
                .padding(.horizontal)
        }
        .padding()
    }
}
