//
//  ProductCardView.swift
//  SocioInfonavitApp
//
//  Created by Jesus Perez on 01/10/25.
//

import SwiftUI

struct ProductCardView: View {
    let product: Product
    var isLocked: Bool = false
    var onTap: (() -> Void)? = nil

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            ZStack {
                AsyncImage(url: URL(string: product.images.first ?? "")) { phase in
                    switch phase {
                    case .empty:
                        Rectangle()
                            .fill(Color.gray.opacity(0.2))
                            .overlay(
                                ProgressView()
                            )
                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFill()
                    case .failure:
                        Rectangle()
                            .fill(Color.gray.opacity(0.2))
                            .overlay(
                                Image(systemName: "photo")
                                    .font(.largeTitle)
                                    .foregroundColor(.gray)
                            )
                    @unknown default:
                        EmptyView()
                    }
                }
                .frame(height: 180)
                .clipped()
                .cornerRadius(12)

                if isLocked {
                    Color.black.opacity(0.5)
                        .cornerRadius(12)

                    Image(systemName: "lock.fill")
                        .font(.system(size: 32))
                        .foregroundColor(.white)
                }
            }

            Text(product.title)
                .font(.app(.montserratSemiBold, size: 16))
                .foregroundColor(.primary)
                .lineLimit(1)

            Text("$\(String(format: "%.2f", product.price)) MXN")
                .font(.app(.montserratRegular, size: 14))
                .foregroundColor(.app(.graySecondary))
        }
        .padding(.horizontal)
        .padding(.bottom, 12)
        .onTapGesture {
            onTap?()
        }
    }
}
