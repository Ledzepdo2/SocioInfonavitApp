//
//  AppErrorManager.swift
//  SocioInfonavitApp
//
//  Created by Jesus Perez on 01/10/25.
//

import Combine
import FirebaseAuth
import SwiftUI

enum AppError: LocalizedError, Identifiable {
    // MARK: - Cases

    case validation(message: String)
    case network(message: String)
    case server(message: String)
    case firebase(message: String)
    case unknown

    // MARK: - Identifiable

    var id: String { localizedDescription }

    // MARK: - LocalizedError

    var errorDescription: String? {
        switch self {
        case let .validation(message), let .network(message), let .server(message), let .firebase(message):
            return message
        case .unknown:
            return "Something went wrong"
        }
    }

    // MARK: - Initialization

    init(firebaseError error: Error) {
        let nsError = error as NSError

        if let errCode = AuthErrorCode(rawValue: nsError.code) {
            switch errCode.code {
            case .invalidEmail:
                self = .firebase(message: "Correo inválido")
            case .wrongPassword:
                self = .firebase(message: "Credenciales inválidas")
            case .userNotFound:
                self = .firebase(message: "El usuario no existe")
            case .emailAlreadyInUse:
                self = .firebase(message: "El correo ya está registrado")
            case .weakPassword:
                self = .firebase(message: "La contraseña es muy débil")
            case .tooManyRequests:
                self = .firebase(message: "Demasiados intentos. Intenta más tarde")
            default:
                self = .firebase(message: "Ocurrió un error inesperado")
            }
        } else {
            self = .unknown
        }
    }
}

@MainActor
final class AppErrorManager: ObservableObject {
    // MARK: - Singleton

    static let shared = AppErrorManager()

    // MARK: - Published Properties

    @Published var currentError: AppError?

    // MARK: - Initialization

    private init() {}

    // MARK: - Public Methods

    func present(error: AppError) {
        currentError = error
    }

    func dismiss() {
        currentError = nil
    }
}
