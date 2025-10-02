import Combine
import FirebaseAuth
import SwiftUI

// MARK: - AppCoordinator

final class AppCoordinator: ObservableObject {
  @Published var rootView: AnyView = AnyView(EmptyView())
  @StateObject private var homeViewModel = HomeViewModel()

  // MARK: - Initialization

  init() {
    start()
  }

  // MARK: - Navigation

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
      AppErrorManager.shared.present(
        error: .server(message: String(localized: "coordinator.error.logoutFailed"))
      )
    }
  }

  func navigateToMyBenevits() {
    homeViewModel.loadMockBenevits()
    showHome()
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
