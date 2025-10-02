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
  @Published var rootView: AnyView = AnyView(EmptyView())

  init() {
    start()
  }

  func start() {
    if Auth.auth().currentUser != nil {
      showHome()
    } else {
      showLauncher()
    }
  }

  private func showLauncher() {
    rootView = AnyView(LaunchScreenView())
  }

  private func showHome() {
    rootView = AnyView(HomeView())
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
}
