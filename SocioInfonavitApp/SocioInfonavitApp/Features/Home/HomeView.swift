//
//  HomeView.swift
//  SocioInfonavitApp
//
//  Created by Jesus Perez on 01/10/25.
//

import SwiftUI

struct HomeView: View {
    // MARK: - Properties

    @ObservedObject var viewModel: HomeViewModel
    @State private var isMenuOpen = false
    @EnvironmentObject private var coordinator: AppCoordinator

    // MARK: - View

    var body: some View {
        SideMenuContainer(
            isOpen: $isMenuOpen,
            menuWidth: 280
        ) {
            mainContent
        } menu: {
            sideMenu
        }
    }

    // MARK: - Private Views

    private var mainContent: some View {
        VStack {
            HomeHeader(isMenuOpen: $isMenuOpen)

            if viewModel.isLoading {
                SkeletonListView()
            } else if viewModel.filteredProducts.isEmpty {
                EmptyStateView()
            } else {
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 32) {
                        if viewModel.showingBenevits {
                            BenevitsListView(viewModel: viewModel)
                        }

                        ProductsListView(viewModel: viewModel)
                    }
                    .padding(.vertical)
                }
            }
        }
        .background(Color.app(.backgroundPrimary).ignoresSafeArea())
        .onAppear(perform: loadProductsIfNeeded)
    }

    private var sideMenu: some View {
        HamburgerMenuView(
            query: $viewModel.query,
            onLogout: coordinator.logout,
            onMyBenevits: presentBenevits
        )
    }

    // MARK: - Private Methods

    private func loadProductsIfNeeded() {
        if !viewModel.showingBenevits {
            viewModel.fetchProducts()
        }
    }

    private func presentBenevits() {
        viewModel.loadMockBenevits()
        viewModel.showingBenevits = true

        withAnimation {
            isMenuOpen = false
        }
    }
}
