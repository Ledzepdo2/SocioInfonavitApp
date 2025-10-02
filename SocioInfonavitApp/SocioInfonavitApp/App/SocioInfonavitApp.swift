//
//  SocioInfonavitApp.swift
//  SocioInfonavitApp
//
//  Created by Jesus Perez on 30/09/25.
//

import Combine
import SwiftUI

@main
struct SocioInfonavitApp: App {
  @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
  @StateObject private var coordinator = AppCoordinator()

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
