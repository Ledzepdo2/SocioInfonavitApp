//
//  PasswordCustomTextField.swift
//  SocioInfonavitApp
//
//  Created by Jesus Perez on 01/10/25.
//

import Combine
import SwiftUI

struct PasswordCustomTextField: View {
  @Binding var text: String
  let placeholder: String

  @State private var isSecure: Bool = true
  @State private var isValid: Bool = true

  var body: some View {
    VStack(alignment: .leading, spacing: 4) {
      HStack {
        if isSecure {
          SecureField(placeholder, text: $text)
            .textContentType(.password)
            .onChange(of: text) { _ in
              isValid = validatePassword(text)
            }
        } else {
          TextField(placeholder, text: $text)
            .textContentType(.password)
            .onChange(of: text) { _ in
              isValid = validatePassword(text)
            }
        }

        Button(action: {
          isSecure.toggle()
        }) {
          Image(systemName: isSecure ? "eye.slash.fill" : "eye.fill")
            .foregroundColor(.app(.graySecondary))
        }
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

  private func validatePassword(_ input: String) -> Bool {
    let regex = "^(?=.*[A-Z])(?=.*[a-z])(?=.*\\d)(?=.*[@$!%*?&#])[A-Za-z\\d@$!%*?&#]{8,}$"
    return NSPredicate(format: "SELF MATCHES %@", regex).evaluate(with: input)
  }
}
