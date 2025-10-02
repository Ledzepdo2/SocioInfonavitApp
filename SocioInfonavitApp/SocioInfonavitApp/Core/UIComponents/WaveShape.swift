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
        
        path.move(to: .zero)
        path.addLine(to: CGPoint(x: 0, y: rect.height * 0.8))
        
        path.addQuadCurve(
            to: CGPoint(x: rect.width, y: rect.height * 0.6),
            control: CGPoint(x: rect.width * 0.5, y: rect.height * 1.0)
        )
        
        path.addLine(to: CGPoint(x: rect.width, y: 0))
        path.closeSubpath()
        
        return path
    }
}
