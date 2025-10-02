//
//  CustomTextField.swift
//  SocioInfonavitApp
//
//  Created by Jesus Perez on 01/10/25.
//

import Combine
import SwiftUI

struct CustomTextField: View {
    // MARK: - Properties

    @Binding var text: String
    let placeholder: String

    @State private var isValid = true

    // MARK: - View

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            TextField(placeholder, text: $text)
                .keyboardType(.emailAddress)
                .textInputAutocapitalization(.none)
                .onChange(of: text, perform: validate)

            Rectangle()
                .fill(lineColor)
                .frame(height: 2)
        }
        .padding(.vertical, 8)
    }

    private var lineColor: Color {
        guard !text.isEmpty else {
            return Color.app(.graySecondary)
        }

        return isValid ? Color.app(.redPrimary) : Color.red
    }

    // MARK: - Private Methods

    private func validate(_ input: String) {
        let userRegex = "^[0-9]{8,11}$"
        let emailRegex = "^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$"

        let userPredicate = NSPredicate(format: "SELF MATCHES %@", userRegex)
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)

        isValid = userPredicate.evaluate(with: input) || emailPredicate.evaluate(with: input)
    }
}
