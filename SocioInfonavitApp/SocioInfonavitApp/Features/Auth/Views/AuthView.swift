//
//  MainView.swift
//  SocioInfonavitApp
//
//  Created by Jesus Perez on 30/09/2025
//

import SwiftUI
import Combine
import FirebaseAuth

struct AuthView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Hello, world!").font(.custom(AppFont.montserratRegular.rawValue, size: 18))
            Button("Probar Login") {
                Auth.auth().signIn(withEmail: "testuser@mail.com", password: "123456") { result, error in
                    if let error = error {
                        print("❌ Error login: \(error.localizedDescription)")
                    } else if let user = result?.user {
                        print("✅ Login exitoso, UID: \(user.uid)")
                    }
                }
            }
            LoadingInfonavitView()
        }
        .padding()
    }
}
#Preview {
    AuthView()
        .environmentObject(AppCoordinator())
}
