//
//  SocioInfonavitApp.swift
//  SocioInfonavitApp
//
//  Created by Jesus Perez on 30/09/25.
//

import SwiftUI
import Combine

@main
struct SocioInfonavitApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject private var coordinator = AppCoordinator()
    @StateObject private var errorManager = AppErrorManager.shared // ✅ Nuevo

    var body: some Scene {
        WindowGroup {
            NavigationStack {
                coordinator.rootView
                    .overlay {
                        if let error = errorManager.currentError {
                            ErrorModalView(error: error) {
                                errorManager.dismiss()
                            }
                            .transition(.scale)
                            .zIndex(1)
                        }
                    }
            }
        }
    }
}
