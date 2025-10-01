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

    var body: some Scene {
        WindowGroup {
            NavigationStack {
                coordinator.rootView
            }
        }
    }
}
