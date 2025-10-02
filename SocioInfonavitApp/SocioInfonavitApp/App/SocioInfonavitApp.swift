import Combine
import SwiftUI

@main
// MARK: - SocioInfonavitApp
struct SocioInfonavitApp: App {
  @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
  @StateObject private var coordinator = AppCoordinator()

  // MARK: - Scene

  var body: some Scene {
    WindowGroup {
      NavigationStack {
        coordinator.rootView
          .overlay {
            if let error = AppErrorManager.shared.currentError {
              ErrorModalView(error: error) {
                AppErrorManager.shared.dismiss()
              }
              .transition(.scale)
              .zIndex(1)
            }
          }
      }
      .environmentObject(coordinator)
    }
  }
}
