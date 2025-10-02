//
//  HomeHeader.swift
//  SocioInfonavitApp
//
//  Created by Jesus Perez on 02/10/25.
//

import SwiftUI

struct HomeHeader: View {
    @Binding var isMenuOpen: Bool

    var body: some View {
        HStack {
            Button(action: {
                withAnimation { isMenuOpen.toggle() }
            }) {
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
}
