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

  // MARK: - Properties

  @Published var rootView: AnyView = AnyView(EmptyView())
  @StateObject private var homeViewModel = HomeViewModel()

  // MARK: - Initialization

  init() {
    start()
  }

  // MARK: - Lifecycle

  func start() {
    if Auth.auth().currentUser != nil {
      showHome()
    } else {
      showLauncher()
    }
  }

  // MARK: - Navigation

  func navigateToHome() {
    showHome()
  }

  func navigateToMyBenevits() {
    homeViewModel.loadMockBenevits()
    showHome()
  }

  // MARK: - Session

  func logout() {
    do {
      try Auth.auth().signOut()
      showLauncher()
    } catch {
      AppErrorManager.shared.present(error: .server(message: "Logout failed"))
    }
  }

  // MARK: - Private Helpers

  private func showLauncher() {
    rootView = AnyView(LaunchScreenView())
  }

  private func showHome() {
    let view = HomeView(viewModel: homeViewModel)
      .environmentObject(self)
    rootView = AnyView(view)
  }
}
