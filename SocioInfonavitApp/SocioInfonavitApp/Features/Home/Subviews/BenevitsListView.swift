//
//  BenevitsListView.swift
//  SocioInfonavitApp
//
//  Created by Jesus Perez on 02/10/25.
//

import SwiftUI

struct BenevitsListView: View {
    @ObservedObject var viewModel: HomeViewModel

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Mis Benevits")
                .font(.app(.montserratSemiBold, size: 20))
                .foregroundColor(.primary)
                .padding(.horizontal)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(viewModel.filteredProducts) { product in
                        ProductCardView(
                            product: product,
                            isLocked: product.isLocked ?? false
                        ) {
                            if product.isLocked == true {
                                AppErrorManager.shared.present(
                                    error: .validation(message: "Este benevit está bloqueado")
                                )
                            } else {
                                print("Navegar a detalle de \(product.title)")
                            }
                        }
                        .frame(width: 180)
                    }
                }
                .padding(.horizontal)
            }
        }
        .padding(.top, 20)
    }
}
