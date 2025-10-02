//
//  AppCoordinator.swift
//  SocioInfonavitApp
//
//  Created by Jesus Perez on 30/09/25.
//

import Combine
import FirebaseAuth
import SwiftUI

final class AppCoordinator: ObservableObject {
    // MARK: - Published Properties

    @Published var rootView: AnyView = AnyView(EmptyView())

    // MARK: - Private Properties

    @StateObject private var homeViewModel = HomeViewModel()

    // MARK: - Initialization

    init() {
        start()
    }

    // MARK: - Public Methods

    func start() {
        if Auth.auth().currentUser != nil {
            showHome()
        } else {
            showLauncher()
        }
    }

    func navigateToHome() {
        showHome()
    }

    func logout() {
        do {
            try Auth.auth().signOut()
            showLauncher()
        } catch {
            AppErrorManager.shared.present(error: .server(message: "Logout failed"))
        }
    }

    func navigateToMyBenevits() {
        homeViewModel.loadMockBenevits()
        showHome()
    }

    // MARK: - Private Methods

    private func showLauncher() {
        rootView = AnyView(LaunchScreenView())
    }

    private func showHome() {
        let view = HomeView(viewModel: homeViewModel)
            .environmentObject(self)
        rootView = AnyView(view)
    }
}
