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
  @ObservedObject private var errorManager = AppErrorManager.shared

  var body: some View {
    ZStack {
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

      VStack(spacing: 24) {
        Spacer()

        Picker("Mode", selection: $viewModel.isRegistering) {
          Text("Iniciar sesión")
            .tag(false)
          Text("Registrarme")
            .tag(true)
        }
        .pickerStyle(SegmentedPickerStyle())
        .tint(Color.app(.redPrimary))
        .padding(.horizontal)

        Text(viewModel.isRegistering ? "Crea tu cuenta" : "Bienvenido de nuevo")
          .font(.app(.montserratSemiBold, size: 26))
          .foregroundColor(.app(.redPrimary))

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

        Button(action: {
          if viewModel.isRegistering {
            viewModel.register { success in
              if success { coordinator.navigateToHome() }
            }
          } else {
            viewModel.login { success in
              if success { coordinator.navigateToHome() }
            }
          }
        }) {
          Text(viewModel.isRegistering ? "Registrar" : "Iniciar sesión")
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
            .padding()
            .background(viewModel.isFormValid ? Color.app(.redPrimary) : Color.gray.opacity(0.4))
            .cornerRadius(12)
        }
        .disabled(!viewModel.isFormValid || viewModel.isLoading)
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
}
