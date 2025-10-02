//
//  ErrorModalView.swift
//  SocioInfonavitApp
//
//  Created by Jesus Perez on 01/10/25.
//

import SwiftUI

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
        ZStack {
            Color.black.opacity(0.4)
                .ignoresSafeArea()
                .onTapGesture {
                    onDismiss()
                }

            VStack(spacing: 20) {
                Image(systemName: "exclamationmark.triangle.fill")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .foregroundColor(.red)

                Text(error.localizedDescription)
                    .multilineTextAlignment(.center)
                    .font(.app(.montserratRegular, size: 16))
                    .foregroundColor(.black)
                    .padding(.horizontal)

                Button(action: {
                    onDismiss()
                }) {
                    Text("OK")
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.app(.redPrimary))
                        .cornerRadius(12)
                }
            }
            .padding()
            .background(Color.white)
            .cornerRadius(16)
            .shadow(radius: 10)
            .padding(.horizontal, 40)
        }
    }
}
