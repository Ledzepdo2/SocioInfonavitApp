//
//  HamburgerMenuView.swift
//  SocioInfonavitApp
//
//  Created by Jesus Perez on 01/10/25.
//

import SwiftUI

//
//  HamburgerMenuView.swift
//  SocioInfonavitApp
//
//  Created by Jesus Perez on 02/10/25.
//

import SwiftUI

struct HamburgerMenuView: View {
    @Binding var query: String
    let onLogout: () -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            HStack(spacing: 12) {
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .frame(width: 52, height: 52)
                    .foregroundColor(.app(.redPrimary))

                VStack(alignment: .leading, spacing: 4) {
                    Text("Socio Infonavit")
                        .font(.app(.montserratSemiBold, size: 16))
                        .foregroundColor(.primary)

                    Text("Bienvenido")
                        .font(.app(.montserratRegular, size: 14))
                        .foregroundColor(.app(.graySecondary))
                }
            }

            Divider()

            SearchBarView(query: $query)

            Divider()

            Button(action: onLogout) {
                Label("Cerrar sesión", systemImage: "rectangle.portrait.and.arrow.right")
                    .font(.app(.montserratSemiBold, size: 16))
                    .foregroundColor(.red)
            }

            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.app(.backgroundPrimary))
    }
}
