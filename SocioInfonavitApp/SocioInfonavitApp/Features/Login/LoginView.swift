//
//  LoginView.swift
//  SocioInfonavitApp
//
//  Created by Jesus Perez on 01/10/25.
//

import SwiftUI

struct LoginView: View {
    @StateObject private var viewModel = LoginViewModel()
    @EnvironmentObject var coordinator: AppCoordinator

    var body: some View {
        VStack(spacing: 24) {
            Spacer()

            Text("Inicia sesión")
                .font(.app(.montserratSemiBold, size: 28))
                .foregroundColor(.app(.redPrimary))

            VStack(spacing: 16) {
                TextField("Correo electrónico", text: $viewModel.email)
                    .keyboardType(.emailAddress)
                    .textContentType(.emailAddress)
                    .autocapitalization(.none)
                    .padding()
                    .background(Color.app(.backgroundSecondary))
                    .cornerRadius(12)

                SecureField("Contraseña", text: $viewModel.password)
                    .textContentType(.password)
                    .padding()
                    .background(Color.app(.backgroundSecondary))
                    .cornerRadius(12)
            }

            if let error = viewModel.loginError {
                Text(error)
                    .foregroundColor(.red)
                    .font(.app(.montserratRegular, size: 14))
                    .multilineTextAlignment(.center)
            }

            Button(action: {
                viewModel.login { success in
                    if success {
                        coordinator.navigateToHome()
                    }
                }
            }) {
                Text("Iniciar sesión")
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(viewModel.isFormValid ? Color.app(.redPrimary) : Color.gray.opacity(0.4))
                    .cornerRadius(12)
            }
            .disabled(!viewModel.isFormValid || viewModel.isLoading)

            if viewModel.isLoading {
                LoadingInfonavitView()
                    .frame(width: 50, height: 50)
                    .padding(.top)
            }

            Spacer()
        }
        .padding()
        .background(Color.app(.backgroundPrimary))
        .ignoresSafeArea(.keyboard)
    }
}
