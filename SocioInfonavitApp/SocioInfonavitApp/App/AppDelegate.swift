//
//  AppDelegate.swift
//  SocioInfonavitApp
//
//  Created by Jesus Perez on 30/09/25.
//

import FirebaseCore
import UIKit

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
