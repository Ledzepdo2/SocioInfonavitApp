//
//  LoadingInfonavitView.swift
//  SocioInfonavitApp
//
//  Created by Jesus Perez on 01/10/25.
//

import SwiftUI

struct LoadingInfonavitView: View {
    @State private var animate = false
    var color: Color = .white

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

