//
//  HomeView.swift
//  SocioInfonavitApp
//
//  Created by Jesus Perez on 01/10/25.
//

import SwiftUI

struct HomeView: View {
  @StateObject private var viewModel = HomeViewModel()
  @State private var isMenuOpen = false
  @EnvironmentObject var coordinator: AppCoordinator

  var body: some View {
    SideMenuContainer(
      isOpen: $isMenuOpen,
      menuWidth: 280
    ) {
      VStack {
        HStack {
          Button(action: {
            withAnimation { isMenuOpen.toggle() }
          }) {
            Image(systemName: "line.horizontal.3")
              .font(.title2)
              .foregroundColor(.app(.redPrimary))
          }
          Spacer()
          Text("Socio Infonavit")
            .font(.app(.montserratSemiBold, size: 20))
            .foregroundColor(.app(.redPrimary))
          Spacer()
        }
        .padding(.horizontal)
        .padding(.top, 16)

        if viewModel.isLoading {
          ScrollView {
            LazyVStack(spacing: 16) {
              ForEach(0..<6, id: \.self) { _ in
                SkeletonProductView()
              }
            }
            .padding()
          }
        } else if viewModel.filteredProducts.isEmpty {
          VStack(spacing: 12) {
            Image(systemName: "exclamationmark.triangle.fill")
              .font(.largeTitle)
              .foregroundColor(.app(.graySecondary))
            Text("No se encontraron productos")
              .font(.app(.montserratRegular, size: 16))
              .foregroundColor(.app(.graySecondary))
          }
          .padding(.top, 50)
        } else {
          ScrollView {
            LazyVStack(spacing: 16) {
              ForEach(viewModel.filteredProducts) { product in
                ProductCardView(product: product) {
                  print("Tapped product: \(product.title)")
                }
              }
            }
            .padding()
          }
        }
      }
      .background(Color.app(.backgroundPrimary).ignoresSafeArea())
      .onAppear {
        viewModel.fetchProducts()
      }
    } menu: {
      HamburgerMenuView(
        query: $viewModel.query,
        onLogout: {
          coordinator.logout()
        }
      )
    }
  }
}
