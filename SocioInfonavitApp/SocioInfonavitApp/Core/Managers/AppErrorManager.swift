//
//  AppErrorManager.swift
//  SocioInfonavitApp
//
//  Created by Jesus Perez on 01/10/25.
//

import SwiftUI
import Combine

enum AppError: LocalizedError, Identifiable {
    var id: String { localizedDescription }

    case validation(message: String)
    case network(message: String)
    case server(message: String)
    case unknown

    var errorDescription: String? {
        switch self {
        case .validation(let message): return "Validation Error: \(message)"
        case .network(let message): return "Network Error: \(message)"
        case .server(let message): return "Server Error: \(message)"
        case .unknown: return "Something went wrong"
        }
    }
}

@MainActor
final class AppErrorManager: ObservableObject {
    static let shared = AppErrorManager() 
    
    @Published var currentError: AppError?

    private init() {}

    func present(error: AppError) {
        currentError = error
    }

    func dismiss() {
        currentError = nil
    }
}
