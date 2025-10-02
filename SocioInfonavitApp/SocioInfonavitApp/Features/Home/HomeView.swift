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
    @EnvironmentObject var coordinator: AppCoordinator

    // MARK: - View

    var body: some View {
        SideMenuContainer(
            isOpen: $isMenuOpen,
            menuWidth: 280
        ) {
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
            .onAppear {
                if !viewModel.showingBenevits {
                    viewModel.fetchProducts()
                }
            }
        } menu: {
            HamburgerMenuView(
                query: $viewModel.query,
                onLogout: {
                    coordinator.logout()
                },
                onMyBenevits: {
                    viewModel.loadMockBenevits()
                    viewModel.showingBenevits = true
                    withAnimation {
                        isMenuOpen = false
                    }
                }
            )
        }
    }
}
