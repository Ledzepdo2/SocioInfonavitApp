//
//  ProductCardView.swift
//  SocioInfonavitApp
//
//  Created by Jesus Perez on 01/10/25.
//

import SwiftUI

struct ProductCardView: View {
    // MARK: - Properties

    let product: Product
    var isLocked = false
    var action: (() -> Void)?

    // MARK: - View

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            productImage
            productTitle
            productPrice
        }
        .frame(width: 160)
        .padding(.bottom, 12)
        .onTapGesture(perform: triggerAction)
    }

    // MARK: - Private Views

    private var productImage: some View {
        ZStack {
            AsyncImage(url: URL(string: product.images.first ?? "")) { phase in
                switch phase {
                case .empty:
                    placeholderImage
                case let .success(image):
                    image
                        .resizable()
                        .scaledToFill()
                case .failure:
                    failureImage
                @unknown default:
                    EmptyView()
                }
            }
            .frame(height: 180)
            .clipped()
            .cornerRadius(12)

            if isLocked {
                lockedOverlay
            }
        }
    }

    private var productTitle: some View {
        Text(product.title)
            .font(.app(.montserratSemiBold, size: 16))
            .foregroundColor(.primary)
            .lineLimit(1)
    }

    private var productPrice: some View {
        Text("$\(String(format: "%.2f", product.price)) MXN")
            .font(.app(.montserratRegular, size: 14))
            .foregroundColor(.app(.graySecondary))
    }

    private var placeholderImage: some View {
        Rectangle()
            .fill(Color.gray.opacity(0.2))
            .overlay(ProgressView())
    }

    private var failureImage: some View {
        Rectangle()
            .fill(Color.gray.opacity(0.2))
            .overlay(
                Image(systemName: "photo")
                    .font(.largeTitle)
                    .foregroundColor(.gray)
            )
    }

    private var lockedOverlay: some View {
        Color.black.opacity(0.5)
            .cornerRadius(12)
            .frame(height: 180)
            .overlay(
                Image(systemName: "lock.fill")
                    .font(.system(size: 32))
                    .foregroundColor(.white)
            )
    }

    // MARK: - Private Methods

    private func triggerAction() {
        action?()
    }
}
