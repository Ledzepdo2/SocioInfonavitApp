
import Combine
import FirebaseAuth
import Foundation

// MARK: - LoginViewModel

@MainActor
final class LoginViewModel: ObservableObject {
  @Published var email = ""
  @Published var password = ""
  @Published var isLoading = false
  @Published var isRegistering = false

  var isFormValid: Bool {
    !email.isEmpty && !password.isEmpty
  }

  // MARK: - Public API

  func login(completion: @escaping (Bool) -> Void) {
    guard isFormValid else {
      AppErrorManager.shared.present(
        error: .validation(message: String(localized: "login.error.fillAllFields"))
      )
      return
    }

    guard validateUserOrEmail(email) else {
      AppErrorManager.shared.present(
        error: .validation(
          message: String(localized: "login.error.invalidUserOrEmail")
        )
      )
      return
    }

    guard validatePassword(password) else {
      AppErrorManager.shared.present(
        error: .validation(
          message:
            String(localized: "login.error.invalidPasswordRequirements")
        ))
      return
    }

    isLoading = true

    Auth.auth().signIn(withEmail: email, password: password) { result, error in
      Task { @MainActor in
        self.isLoading = false
        if let error = error {
          print("❌ Firebase Login Error:", error.localizedDescription)
          AppErrorManager.shared.present(error: AppError(firebaseError: error))
          completion(false)
        } else if result?.user != nil {
          self.password = ""
          completion(true)
        } else {
          AppErrorManager.shared.present(error: .unknown)
          completion(false)
        }
      }
    }
  }

  // MARK: - Private Helpers

  private func validateUserOrEmail(_ input: String) -> Bool {
    let userRegex = "^[0-9]{8,11}$"
    let emailRegex = "^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$"

    let userPred = NSPredicate(format: "SELF MATCHES %@", userRegex)
    let emailPred = NSPredicate(format: "SELF MATCHES %@", emailRegex)

    return userPred.evaluate(with: input) || emailPred.evaluate(with: input)
  }

  private func validatePassword(_ input: String) -> Bool {
    let regex = "^(?=.*[A-Z])(?=.*[a-z])(?=.*\\d)(?=.*[@$!%*?&#])[A-Za-z\\d@$!%*?&#]{8,}$"
    return NSPredicate(format: "SELF MATCHES %@", regex).evaluate(with: input)
  }

  // MARK: - Registration

  func register(completion: @escaping (Bool) -> Void) {
    guard isFormValid else {
      AppErrorManager.shared.present(
        error: .validation(message: String(localized: "login.error.fillAllFields"))
      )
      return
    }

    guard validatePassword(password) else {
      AppErrorManager.shared.present(
        error: .validation(
          message:
            String(localized: "login.error.invalidPasswordRequirements")
        ))
      return
    }

    isLoading = true

    Auth.auth().createUser(withEmail: email, password: password) { result, error in
      Task { @MainActor in
        self.isLoading = false
        if let error = error {
          print("❌ Firebase Register Error:", error.localizedDescription)
          AppErrorManager.shared.present(error: AppError(firebaseError: error))
          completion(false)
        } else if result?.user != nil {
          self.password = ""
          completion(true)
        } else {
          AppErrorManager.shared.present(error: .unknown)
          completion(false)
        }
      }
    }
  }
}
