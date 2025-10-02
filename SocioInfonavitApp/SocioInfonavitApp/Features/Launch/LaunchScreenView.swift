//
//  LaunchScreenView.swift
//  SocioInfonavitApp
//
//  Created by Jesus Perez on 01/10/25.
//

import SwiftUI

struct LaunchScreenView: View {
    // MARK: - Properties

    @State private var showLogin = false

    // MARK: - View

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color.app(.redPrimary)
                    .ignoresSafeArea()

                logo(in: geometry)
                loadingIndicator(in: geometry)
            }
        }
        .onAppear(perform: presentLoginAfterDelay)
        .fullScreenCover(isPresented: $showLogin, content: LoginView.init)
    }

    // MARK: - Private Views

    private func logo(in geometry: GeometryProxy) -> some View {
        Image.app(.socioInfonavit)
            .resizable()
            .scaledToFit()
            .padding(.horizontal, 32)
            .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
    }

    private func loadingIndicator(in geometry: GeometryProxy) -> some View {
        LoadingInfonavitView()
            .frame(width: 80, height: 80)
            .position(
                x: geometry.size.width / 2,
                y: geometry.size.height - (geometry.size.height / 3)
            )
    }

    // MARK: - Private Methods

    private func presentLoginAfterDelay() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
            showLogin = true
        }
    }
}
