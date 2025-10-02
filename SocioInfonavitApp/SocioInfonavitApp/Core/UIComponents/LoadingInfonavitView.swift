import SwiftUI

// MARK: - LoadingInfonavitView

struct LoadingInfonavitView: View {
  // MARK: - Properties

  @State private var animate = false
  var color: Color = .white

  // MARK: - Body

  var body: some View {
    Image(systemName: "house.fill")
      .resizable()
      .scaledToFit()
      .frame(width: 60, height: 60)
      .foregroundColor(color)
      .opacity(animate ? 0.3 : 1.0)
      .scaleEffect(animate ? 0.9 : 1.05)
      .animation(
        Animation.easeInOut(duration: 1.0).repeatForever(autoreverses: true),
        value: animate
      )
      .onAppear {
        animate = true
      }
  }
}
