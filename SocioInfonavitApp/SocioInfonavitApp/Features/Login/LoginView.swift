import SwiftUI

// MARK: - LoginView

struct LoginView: View {
  // MARK: - Properties

  @StateObject private var viewModel = LoginViewModel()
  @EnvironmentObject var coordinator: AppCoordinator
  @ObservedObject private var errorManager = AppErrorManager.shared

  private var subtitleKey: LocalizedStringKey {
    viewModel.isRegistering ? "login.subtitle.register" : "login.subtitle.welcomeBack"
  }

  private var actionButtonTitleKey: LocalizedStringKey {
    viewModel.isRegistering ? "login.button.register" : "login.button.signIn"
  }

  // MARK: - Body

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

        Picker("login.picker.mode", selection: $viewModel.isRegistering) {
          Text("login.mode.signIn")
            .tag(false)
          Text("login.mode.register")
            .tag(true)
        }
        .pickerStyle(SegmentedPickerStyle())
        .tint(Color.app(.redPrimary))
        .padding(.horizontal)

        Text(subtitleKey)
          .font(.app(.montserratSemiBold, size: 26))
          .foregroundColor(.app(.redPrimary))

        VStack(spacing: 16) {
          CustomTextField(
            text: $viewModel.email,
            placeholder: String(localized: "login.placeholder.userOrEmail")
          )

          PasswordCustomTextField(
            text: $viewModel.password,
            placeholder: String(localized: "login.placeholder.password")
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
          Text(actionButtonTitleKey)
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
