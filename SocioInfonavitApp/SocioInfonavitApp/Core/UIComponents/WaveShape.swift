//
//  WaveShape.swift
//  SocioInfonavitApp
//
//  Created by Jesus Perez on 01/10/25.
//

import SwiftUI

struct WaveShape: Shape {
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
