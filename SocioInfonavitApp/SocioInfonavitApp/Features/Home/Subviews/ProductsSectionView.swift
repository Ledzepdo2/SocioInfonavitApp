//
//  ProductsSectionView.swift
//  SocioInfonavitApp
//
//  Created by Jesus Perez on 02/10/25.
//

import SwiftUI

struct ProductsSectionView: View {
    // MARK: - Properties

    let title: String
    let products: [Product]
    var action: ((Product) -> Void)?

    // MARK: - View

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            sectionHeader
            productsScroll
        }
        .padding(.vertical, 8)
    }

    // MARK: - Private Views

    private var sectionHeader: some View {
        Text(title)
            .font(.app(.montserratSemiBold, size: 18))
            .foregroundColor(.primary)
            .padding(.horizontal)
    }

    private var productsScroll: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 16) {
                ForEach(products) { product in
                    ProductCardView(product: product) {
                        action?(product)
                    }
                    .frame(width: 200)
                }
            }
            .padding(.horizontal)
        }
    }
}
