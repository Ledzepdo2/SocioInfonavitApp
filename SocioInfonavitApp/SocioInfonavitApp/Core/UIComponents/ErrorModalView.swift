//
//  ErrorModalView.swift
//  SocioInfonavitApp
//
//  Created by Jesus Perez on 01/10/25.
//

import SwiftUI

struct ErrorModalView: View {
    let error: AppError
    let onDismiss: () -> Void

    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "exclamationmark.triangle.fill")
                .resizable()
                .frame(width: 40, height: 40)
                .foregroundColor(.red)

            Text(error.localizedDescription)
                .multilineTextAlignment(.center)
                .font(.app(.montserratRegular, size: 16))
                .padding()

            Button("OK") {
                onDismiss()
            }
            .foregroundColor(.white)
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.app(.redPrimary))
            .cornerRadius(12)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(16)
        .shadow(radius: 10)
        .padding(40)
    }
}
