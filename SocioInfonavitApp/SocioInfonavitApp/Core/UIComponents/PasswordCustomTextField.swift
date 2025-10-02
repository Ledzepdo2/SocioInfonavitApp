//
//  PasswordCustomTextField.swift
//  SocioInfonavitApp
//
//  Created by Jesus Perez on 01/10/25.
//

import Combine
import SwiftUI

struct PasswordCustomTextField: View {
    // MARK: - Properties

    @Binding var text: String
    let placeholder: String

    @State private var isSecure = true
    @State private var isValid = true

    // MARK: - View

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack {
                passwordField
                toggleVisibilityButton
            }

            Rectangle()
                .fill(lineColor)
                .frame(height: 2)
        }
        .padding(.vertical, 8)
        .onChange(of: text, perform: validate)
    }

    // MARK: - Private Views

    private var passwordField: some View {
        Group {
            if isSecure {
                SecureField(placeholder, text: $text)
                    .textContentType(.password)
            } else {
                TextField(placeholder, text: $text)
                    .textContentType(.password)
            }
        }
    }

    private var toggleVisibilityButton: some View {
        Button(action: toggleSecure) {
            Image(systemName: isSecure ? "eye.slash.fill" : "eye.fill")
                .foregroundColor(.app(.graySecondary))
        }
    }

    private var lineColor: Color {
        guard !text.isEmpty else {
            return Color.app(.graySecondary)
        }

        return isValid ? Color.app(.redPrimary) : Color.red
    }

    // MARK: - Private Methods

    private func toggleSecure() {
        isSecure.toggle()
    }

    private func validate(_ input: String) {
        isValid = NSPredicate(
            format: "SELF MATCHES %@",
            "^(?=.*[A-Z])(?=.*[a-z])(?=.*\\d)(?=.*[@$!%*?&#])[A-Za-z\\d@$!%*?&#]{8,}$"
        ).evaluate(with: input)
    }
}
