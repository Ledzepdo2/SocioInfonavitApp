//
//  ProductsListView.swift
//  SocioInfonavitApp
//
//  Created by Jesus Perez on 02/10/25.
//

import SwiftUI

struct ProductsListView: View {
    @ObservedObject var viewModel: HomeViewModel

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading, spacing: 32) {
                ProductsSectionView(title: "Casa", products: viewModel.products) { product in
                    print("Tapped: \(product.title)")
                }
                
                ProductsSectionView(title: "Otros", products: viewModel.products) { product in
                    print("Tapped: \(product.title)")
                }
            }
            .padding(.vertical)
        }
    }
}
