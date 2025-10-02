//
//  ShimmerModifier.swift
//  SocioInfonavitApp
//
//  Created by Jesus Perez on 01/10/25.
//

import SwiftUI

struct ShimmerModifier: ViewModifier {
    // MARK: - Properties

    @State private var phase: CGFloat = -0.5

    // MARK: - ViewModifier

    func body(content: Content) -> some View {
        content
            .overlay(shimmerOverlay)
            .mask(content)
    }

    // MARK: - Private Views

    private var shimmerOverlay: some View {
        GeometryReader { geometry in
            Rectangle()
                .fill(shimmerGradient)
                .rotationEffect(.degrees(20))
                .offset(x: geometry.size.width * phase)
                .frame(width: geometry.size.width * 1.5)
                .clipped()
                .onAppear(perform: startAnimation)
        }
    }

    private var shimmerGradient: LinearGradient {
        LinearGradient(
            gradient: Gradient(colors: [
                Color.app(.shimmerStart).opacity(0.3),
                Color.app(.shimmerEnd).opacity(0.6),
                Color.app(.shimmerStart).opacity(0.3),
            ]),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
    }

    // MARK: - Private Methods

    private func startAnimation() {
        withAnimation(
            Animation.linear(duration: 1.5)
                .repeatForever(autoreverses: false)
        ) {
            phase = 1.5
        }
    }
}

// MARK: - View Extension

extension View {
    func shimmer() -> some View {
        modifier(ShimmerModifier())
    }
}
