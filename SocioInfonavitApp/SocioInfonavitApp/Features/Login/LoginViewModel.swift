//
//  LoginViewModel.swift
//  SocioInfonavitApp
//
//  Created by Jesus Perez on 01/10/25.
//

import Combine
import FirebaseAuth
import Foundation

@MainActor
final class LoginViewModel: ObservableObject {
    // MARK: - Published Properties

    @Published var email = ""
    @Published var password = ""
    @Published var isLoading = false
    @Published var isRegistering = false

    // MARK: - Computed Properties

    var isFormValid: Bool {
        !email.isEmpty && !password.isEmpty
    }

    // MARK: - Public Methods

    func login(completion: @escaping (Bool) -> Void) {
        guard validateInputs(requireUserValidation: true) else {
            completion(false)
            return
        }

        authenticate(using: Auth.auth().signIn, completion: completion)
    }

    func register(completion: @escaping (Bool) -> Void) {
        guard validateInputs(requireUserValidation: false) else {
            completion(false)
            return
        }

        authenticate(using: Auth.auth().createUser, completion: completion)
    }

    // MARK: - Private Methods

    private func authenticate(
        using method: @escaping (String, String, @escaping AuthDataResultCallback) -> Void,
        completion: @escaping (Bool) -> Void
    ) {
        isLoading = true

        method(email, password) { result, error in
            Task { @MainActor in
                self.isLoading = false

                if let error = error {
                    print("❌ Firebase Auth Error:", error.localizedDescription)
                    AppErrorManager.shared.present(error: AppError(firebaseError: error))
                    completion(false)
                    return
                }

                guard result?.user != nil else {
                    AppErrorManager.shared.present(error: .unknown)
                    completion(false)
                    return
                }

                self.password = ""
                completion(true)
            }
        }
    }

    private func validateInputs(requireUserValidation: Bool) -> Bool {
        guard isFormValid else {
            AppErrorManager.shared.present(
                error: .validation(message: "Por favor llena todos los campos")
            )
            return false
        }

        if requireUserValidation && !validateUserOrEmail(email) {
            AppErrorManager.shared.present(
                error: .validation(message: "Debes ingresar un número de usuario válido o un email")
            )
            return false
        }

        guard validatePassword(password) else {
            AppErrorManager.shared.present(
                error: .validation(
                    message: "La contraseña debe tener 8+ caracteres, mayúscula, minúscula, número y caracter especial"
                )
            )
            return false
        }

        return true
    }

    private func validateUserOrEmail(_ input: String) -> Bool {
        let userRegex = "^[0-9]{8,11}$"
        let emailRegex = "^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$"

        let userPredicate = NSPredicate(format: "SELF MATCHES %@", userRegex)
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)

        return userPredicate.evaluate(with: input) || emailPredicate.evaluate(with: input)
    }

    private func validatePassword(_ input: String) -> Bool {
        let regex = "^(?=.*[A-Z])(?=.*[a-z])(?=.*\\d)(?=.*[@$!%*?&#])[A-Za-z\\d@$!%*?&#]{8,}$"
        return NSPredicate(format: "SELF MATCHES %@", regex).evaluate(with: input)
    }
}
