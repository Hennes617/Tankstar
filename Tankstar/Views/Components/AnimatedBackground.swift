import SwiftUI

struct AnimatedBackground: View {
    @State private var animate = false
    
    var body: some View {
        LinearGradient(
            colors: [Color.blue.opacity(0.6), Color.purple.opacity(0.8)],
            startPoint: animate ? .topLeading : .bottomTrailing,
            endPoint: animate ? .bottomTrailing : .topLeading
        )
        .animation(.easeInOut(duration: 5).repeatForever(autoreverses: true), value: animate)
        .onAppear {
            animate = true
        }
        .ignoresSafeArea()
    }
}
