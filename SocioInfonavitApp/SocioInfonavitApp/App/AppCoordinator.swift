//
//  AppCoordinator.swift
//  SocioInfonavitApp
//
//  Created by Jesus Perez on 30/09/25.
//

import SwiftUI
import FirebaseAuth
import Combine

final class AppCoordinator: ObservableObject {
    @Published var rootView: AnyView = AnyView(EmptyView())

    init() {
        start()
    }

    func start() {
        if let _ = Auth.auth().currentUser {
            // Usuario ya logueado → ir al Home
            showHome()
        } else {
            // No hay sesión → ir al Login
            showLogin()
        }
    }

    private func showLogin() {
       //let loginView = AuthFactory.makeLoginView(coordinator: self)
       //rootView = AnyView(loginView)
        let loginView = LaunchScreenView()
        rootView = AnyView(loginView)
    }

    private func showHome() {
       // let homeView = HomeFactory.makeHomeView(coordinator: self)
       // rootView = AnyView(homeView)
        let homeView = LaunchScreenView()
        rootView = AnyView(homeView)
    }

    // Navegación desde módulos
    func navigateToHome() {
        showHome()
    }

    func logout() {
        do {
            try Auth.auth().signOut()
            showLogin()
        } catch {
            print("❌ Error al cerrar sesión: \(error)")
        }
    }
}
