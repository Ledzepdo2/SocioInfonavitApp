import FirebaseCore
import UIKit

// MARK: - AppDelegate

class AppDelegate: NSObject, UIApplicationDelegate {
  // MARK: - UIApplicationDelegate

  func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil
  ) -> Bool {
    FirebaseApp.configure()
    return true
  }
}
