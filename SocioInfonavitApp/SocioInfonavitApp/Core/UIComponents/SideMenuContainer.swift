//
//  SideMenuContainer.swift
//  SocioInfonavitApp
//
//  Created by Jesus Perez on 01/10/25.
//

import SwiftUI

struct SideMenuContainer<Content: View, Menu: View>: View {
    // MARK: - Properties

    @Binding var isOpen: Bool
    let menuWidth: CGFloat
    let content: () -> Content
    let menu: () -> Menu

    // MARK: - View

    var body: some View {
        ZStack(alignment: .leading) {
            content()
                .disabled(isOpen)
                .overlay(dimmedOverlay)

            HStack {
                menu()
                    .frame(width: menuWidth)
                    .background(Color.app(.backgroundPrimary))
                    .offset(x: isOpen ? 0 : -menuWidth)
                    .animation(.easeInOut(duration: 0.3), value: isOpen)

                Spacer()
            }
        }
    }

    // MARK: - Private Views

    private var dimmedOverlay: some View {
        Color.black.opacity(isOpen ? 0.4 : 0)
            .ignoresSafeArea()
            .onTapGesture(perform: closeMenu)
    }

    // MARK: - Private Methods

    private func closeMenu() {
        withAnimation(.easeInOut) {
            isOpen = false
        }
    }
}
