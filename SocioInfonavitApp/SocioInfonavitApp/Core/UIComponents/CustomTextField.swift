//
//  CustomTextField.swift
//  SocioInfonavitApp
//
//  Created by Jesus Perez on 01/10/25.
//

import Combine
import SwiftUI

struct CustomTextField: View {
  @Binding var text: String
  let placeholder: String

  @State private var isEditing = false
  @State private var isValid = true

  var body: some View {
    VStack(alignment: .leading, spacing: 4) {
      TextField(placeholder, text: $text)
        .keyboardType(.emailAddress)
        .autocapitalization(.none)
        .onTapGesture { isEditing = true }
        .onChange(of: text) { _ in
          isValid = validateInput(text)
        }

      Rectangle()
        .fill(lineColor)
        .frame(height: 2)
    }
    .padding(.vertical, 8)
  }

  private var lineColor: Color {
    if text.isEmpty {
      return Color.app(.graySecondary)
    } else {
      return Color.app(.redPrimary)
    }
  }

  private func validateInput(_ input: String) -> Bool {
    let userRegex = "^[0-9]{8,11}$"
    let emailRegex = "^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$"

    let userPred = NSPredicate(format: "SELF MATCHES %@", userRegex)
    let emailPred = NSPredicate(format: "SELF MATCHES %@", emailRegex)

    return userPred.evaluate(with: input) || emailPred.evaluate(with: input)
  }
}
