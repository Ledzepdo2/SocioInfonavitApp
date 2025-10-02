import Combine
import FirebaseAuth
import SwiftUI

// MARK: - AppError

enum AppError: LocalizedError, Identifiable {
  var id: String { localizedDescription }

  case validation(message: String)
  case network(message: String)
  case server(message: String)
  case firebase(message: String)
  case unknown

  var errorDescription: String? {
    switch self {
    case .validation(let message): return message
    case .network(let message): return message
    case .server(let message): return message
    case .firebase(let message): return message
    case .unknown: return String(localized: "error.unknown")
    }
  }

  init(firebaseError error: Error) {
    let nsError = error as NSError
    if let errCode = AuthErrorCode(rawValue: nsError.code) {
      switch errCode.code {
      case .invalidEmail:
        self = .firebase(message: String(localized: "error.firebase.invalidEmail"))
      case .wrongPassword:
        self = .firebase(message: String(localized: "error.firebase.invalidCredentials"))
      case .userNotFound:
        self = .firebase(message: String(localized: "error.firebase.userNotFound"))
      case .emailAlreadyInUse:
        self = .firebase(message: String(localized: "error.firebase.emailInUse"))
      case .weakPassword:
        self = .firebase(message: String(localized: "error.firebase.weakPassword"))
      case .tooManyRequests:
        self = .firebase(message: String(localized: "error.firebase.tooManyRequests"))
      default:
        self = .firebase(message: String(localized: "error.firebase.unexpected"))
      }
    } else {
      self = .unknown
    }
  }
}

// MARK: - AppErrorManager

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
