//
//  BenevitsListView.swift
//  SocioInfonavitApp
//
//  Created by Jesus Perez on 02/10/25.
//

import SwiftUI

struct BenevitsListView: View {
    // MARK: - Properties

    @ObservedObject var viewModel: HomeViewModel

    // MARK: - View

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            header
            productsScroll
        }
        .padding(.top, 20)
    }

    // MARK: - Private Views

    private var header: some View {
        Text("Mis Benevits")
            .font(.app(.montserratSemiBold, size: 20))
            .foregroundColor(.primary)
            .padding(.horizontal)
    }

    private var productsScroll: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 16) {
                ForEach(viewModel.filteredProducts) { product in
                    ProductCardView(
                        product: product,
                        isLocked: product.isLocked ?? false,
                        action: { handleSelection(for: product) }
                    )
                    .frame(width: 180)
                }
            }
            .padding(.horizontal)
        }
    }

    // MARK: - Private Methods

    private func handleSelection(for product: Product) {
        guard product.isLocked != true else {
            AppErrorManager.shared.present(
                error: .validation(message: "Este benevit está bloqueado")
            )
            return
        }

        print("Navegar a detalle de \(product.title)")
    }
}
