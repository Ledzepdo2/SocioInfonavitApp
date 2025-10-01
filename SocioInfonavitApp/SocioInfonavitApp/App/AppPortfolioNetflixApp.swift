//
//  AppPortfolioNetflixApp.swift
//  MovieApp
//
//  Created by Jesus Perez on 30/09/25.
//

import SwiftUI
import Combine

@main
struct AppPortfolioNetflixApp: App {
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
