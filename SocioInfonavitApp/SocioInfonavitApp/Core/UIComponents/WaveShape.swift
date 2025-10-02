import SwiftUI

// MARK: - WaveShape

struct WaveShape: Shape {
  // MARK: - Path

  func path(in rect: CGRect) -> Path {
    var path = Path()

    path.move(to: CGPoint(x: 0, y: 0))

    path.addLine(to: CGPoint(x: rect.width, y: 0))

    path.addLine(to: CGPoint(x: rect.width, y: rect.height * 0.8))

    path.addQuadCurve(
      to: CGPoint(x: 0, y: rect.height * 0.8),
      control: CGPoint(x: rect.width / 2, y: rect.height)
    )

    path.closeSubpath()

    return path
  }
}
