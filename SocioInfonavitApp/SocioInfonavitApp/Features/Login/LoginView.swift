//
//  LoginView.swift
//  SocioInfonavitApp
//
//  Created by Jesus Perez on 01/10/25.
//

import SwiftUI

struct LoginView: View {
    // MARK: - Properties

    @StateObject private var viewModel = LoginViewModel()
    @EnvironmentObject private var coordinator: AppCoordinator
    @ObservedObject private var errorManager = AppErrorManager.shared

    // MARK: - View

    var body: some View {
        ZStack {
            waveBackground

            VStack(spacing: 24) {
                Spacer()

                modePicker
                title
                credentialsFields
                actionButton

                if viewModel.isLoading {
                    LoadingInfonavitView(color: .app(.redPrimary))
                        .frame(width: 60, height: 60)
                        .padding(.top)
                }

                Spacer()
            }
            .padding()
            .background(
                Color.app(.backgroundPrimary)
                    .clipShape(RoundedRectangle(cornerRadius: 0))
                    .offset(y: 200)
            )
            .ignoresSafeArea(.keyboard)

            if let error = errorManager.currentError {
                ErrorModalView(error: error) {
                    errorManager.dismiss()
                }
                .zIndex(1)
            }
        }
    }

    // MARK: - Private Views

    private var waveBackground: some View {
        VStack(spacing: 0) {
            ZStack {
                WaveShape()
                    .fill(Color.app(.redPrimary))
                    .frame(height: 250)
                    .ignoresSafeArea(edges: .top)

                VStack(spacing: 12) {
                    Image.app(.people)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 160)

                    Image.app(.socioInfonavit)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 140)
                }
            }

            Spacer()
        }
    }

    private var modePicker: some View {
        Picker("Mode", selection: $viewModel.isRegistering) {
            Text("Iniciar sesión")
                .tag(false)
            Text("Registrarme")
                .tag(true)
        }
        .pickerStyle(.segmented)
        .tint(Color.app(.redPrimary))
        .padding(.horizontal)
    }

    private var title: some View {
        Text(viewModel.isRegistering ? "Crea tu cuenta" : "Bienvenido de nuevo")
            .font(.app(.montserratSemiBold, size: 26))
            .foregroundColor(.app(.redPrimary))
    }

    private var credentialsFields: some View {
        VStack(spacing: 16) {
            CustomTextField(
                text: $viewModel.email,
                placeholder: "Usuario o Email"
            )

            PasswordCustomTextField(
                text: $viewModel.password,
                placeholder: "Contraseña"
            )
        }
    }

    private var actionButton: some View {
        Button(action: handleAction) {
            Text(viewModel.isRegistering ? "Registrar" : "Iniciar sesión")
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .padding()
                .background(viewModel.isFormValid ? Color.app(.redPrimary) : Color.gray.opacity(0.4))
                .cornerRadius(12)
        }
        .disabled(!viewModel.isFormValid || viewModel.isLoading)
    }

    // MARK: - Private Methods

    private func handleAction() {
        let completion: (Bool) -> Void = { success in
            if success {
                coordinator.navigateToHome()
            }
        }

        if viewModel.isRegistering {
            viewModel.register(completion: completion)
        } else {
            viewModel.login(completion: completion)
        }
    }
}
