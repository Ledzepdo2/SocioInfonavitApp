//
//  LoginViewModel.swift
//  SocioInfonavitApp
//
//  Created by Jesus Perez on 01/10/25.
//

import Foundation
import FirebaseAuth
import Combine

@MainActor
final class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var isLoading = false
    @Published var loginError: String?

    var isFormValid: Bool {
        !email.isEmpty && !password.isEmpty
    }

    func login(completion: @escaping (Bool) -> Void) {
        guard isFormValid else { return }

        isLoading = true
        loginError = nil

        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            Task { @MainActor in
                self.isLoading = false
                if let error = error {
                    self.loginError = error.localizedDescription
                    completion(false)
                } else {
                    completion(true)
                }
            }
        }
    }
}
