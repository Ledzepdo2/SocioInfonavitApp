//
//  HamburgerMenuView.swift
//  SocioInfonavitApp
//
//  Created by Jesus Perez on 01/10/25.
//

import SwiftUI

struct HamburgerMenuView: View {
    // MARK: - Properties

    @Binding var query: String
    let onLogout: () -> Void
    let onMyBenevits: () -> Void

    // MARK: - View

    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            profileHeader
            Divider()
            SearchBarView(query: $query)
            Divider()
            benevitsButton
            Spacer()
            logoutButton
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.app(.redPrimary))
    }

    // MARK: - Private Views

    private var profileHeader: some View {
        HStack(spacing: 12) {
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: 52, height: 52)
                .foregroundColor(.white)

            VStack(alignment: .leading, spacing: 4) {
                Text("Socio Infonavit")
                    .font(.app(.montserratSemiBold, size: 16))
                    .foregroundColor(.white)

                Text("Bienvenido")
                    .font(.app(.montserratRegular, size: 14))
                    .foregroundColor(.white)
            }
        }
    }

    private var benevitsButton: some View {
        Button(action: onMyBenevits) {
            Label("Mis Benevits", systemImage: "gift.fill")
                .font(.app(.montserratSemiBold, size: 16))
                .foregroundColor(.white)
        }
    }

    private var logoutButton: some View {
        Button(action: onLogout) {
            Label("Cerrar sesión", systemImage: "rectangle.portrait.and.arrow.right")
                .font(.app(.montserratSemiBold, size: 16))
                .foregroundColor(.white)
        }
    }
}
