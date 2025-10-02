//
//  ProductsListView.swift
//  SocioInfonavitApp
//
//  Created by Jesus Perez on 02/10/25.
//

import SwiftUI

struct ProductsListView: View {
    // MARK: - Properties

    @ObservedObject var viewModel: HomeViewModel

    // MARK: - View

    var body: some View {
        VStack(alignment: .leading, spacing: 32) {
            ProductsSectionView(title: "Casa", products: viewModel.filteredProducts, action: handleSelection)
            ProductsSectionView(title: "Otros", products: viewModel.filteredProducts, action: handleSelection)
        }
        .padding(.vertical)
    }

    // MARK: - Private Methods

    private func handleSelection(_ product: Product) {
        print("Tapped: \(product.title)")
    }
}
