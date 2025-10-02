import SwiftUI

// MARK: - ShimmerModifier

struct ShimmerModifier: ViewModifier {
  @State private var phase: CGFloat = -0.5

  func body(content: Content) -> some View {
    content
      .overlay(
        GeometryReader { geo in
          Rectangle()
            .fill(
              LinearGradient(
                gradient: Gradient(colors: [
                  Color.app(.shimmerStart).opacity(0.3),
                  Color.app(.shimmerEnd).opacity(0.6),
                  Color.app(.shimmerStart).opacity(0.3),
                ]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
              )
            )
            .rotationEffect(.degrees(20))
            .offset(x: geo.size.width * phase)
            .frame(width: geo.size.width * 1.5)
            .clipped()
            .onAppear {
              withAnimation(
                Animation.linear(duration: 1.5)
                  .repeatForever(autoreverses: false)
              ) {
                phase = 1.5
              }
            }
        }
      )
      .mask(content)
  }
}

// MARK: - View+Shimmer

extension View {
  func shimmer() -> some View {
    self.modifier(ShimmerModifier())
  }
}
