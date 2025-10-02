//
//  ProductsSectionView.swift
//  SocioInfonavitApp
//
//  Created by Jesus Perez on 02/10/25.
//

import SwiftUI

struct ProductsSectionView: View {
    let title: String
    let products: [Product]
    var onTapProduct: ((Product) -> Void)? = nil

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(title)
                .font(.app(.montserratSemiBold, size: 18))
                .foregroundColor(.primary)
                .padding(.horizontal)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(products) { product in
                        ProductCardView(product: product, isLocked: false) {
                            onTapProduct?(product)
                        }
                        .frame(width: 200)
                    }
                }
                .padding(.horizontal)
            }
        }
        .padding(.vertical, 8)
    }
}
