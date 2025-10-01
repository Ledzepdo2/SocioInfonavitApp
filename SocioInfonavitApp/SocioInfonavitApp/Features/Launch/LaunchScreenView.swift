//
//  LaunchScreenView.swift
//  SocioInfonavitApp
//
//  Created by Jesus Perez on 01/10/25.
//

import SwiftUI

struct LaunchScreenView: View {
    @State private var showLogin = false

    var body: some View {
        GeometryReader { geo in
            ZStack {
                // Fondo rojo institucional
                Color.app(.redPrimary).ignoresSafeArea()

                // Logo centrado en X y Y
                Image.app(.socioInfonavit)
                    .resizable()
                    .scaledToFit() // mantiene proporción
                    .padding(.horizontal, 32) // 32 de margen en left y right
                    .position(x: geo.size.width / 2, y: geo.size.height / 2)


                // Loader: centrado en X, 1/3 desde abajo en Y
                LoadingInfonavitView()
                    .frame(width: 80, height: 80)
                    .position(
                        x: geo.size.width / 2,
                        y: geo.size.height - (geo.size.height / 3)
                    )
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                showLogin = true
            }
        }
        .fullScreenCover(isPresented: $showLogin) {
            LoginView()
        }
    }
}
