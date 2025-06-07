import SwiftUI

struct ErrorView: View {
    let error: String
    let retryAction: () -> Void
    
    var body: some View {
        VStack(spacing: 16) {
            Image(systemName: "exclamationmark.triangle.fill")
                .font(.system(size: 50))
                .foregroundColor(.red)
            Text("Fehler")
                .font(.title)
                .bold()
            Text(error)
                .multilineTextAlignment(.center)
                .foregroundColor(.secondary)
            Button(action: retryAction) {
                Text("Erneut versuchen")
                    .bold()
                    .padding()
                    .background(Color.red.opacity(0.8))
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
        }
        .padding()
    }
}
