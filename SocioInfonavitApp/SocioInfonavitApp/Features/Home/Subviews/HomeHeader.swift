//
//  HomeHeader.swift
//  SocioInfonavitApp
//
//  Created by Jesus Perez on 02/10/25.
//

import SwiftUI

struct HomeHeader: View {
    // MARK: - Properties

    @Binding var isMenuOpen: Bool

    // MARK: - View

    var body: some View {
        HStack {
            Button(action: toggleMenu) {
                Image(systemName: "line.horizontal.3")
                    .font(.title2)
                    .foregroundColor(.app(.redPrimary))
            }

            Spacer()

            Image.app(.socioInfonavit)
                .resizable()
                .scaledToFit()
                .frame(height: 24)

            Spacer()
        }
        .padding(.horizontal)
        .padding(.top, 16)
    }

    // MARK: - Private Methods

    private func toggleMenu() {
        withAnimation {
            isMenuOpen.toggle()
        }
    }
}
