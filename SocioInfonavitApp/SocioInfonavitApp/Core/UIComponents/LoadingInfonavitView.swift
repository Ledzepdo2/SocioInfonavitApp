//
//  LoadingInfonavitView.swift
//  SocioInfonavitApp
//
//  Created by Jesus Perez on 01/10/25.
//

import SwiftUI

struct LoadingInfonavitView: View {
    @State private var animate = false

    var body: some View {
        Image.app(.infonavit)
            .resizable()
            .scaledToFit()
            .frame(width: 90, height: 90)
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
