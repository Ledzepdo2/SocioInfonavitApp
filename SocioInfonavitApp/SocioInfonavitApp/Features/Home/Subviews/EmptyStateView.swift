//
//  EmptyStateView.swift
//  SocioInfonavitApp
//
//  Created by Jesus Perez on 02/10/25.
//

import SwiftUI

struct EmptyStateView: View {
    var body: some View {
        VStack(spacing: 12) {
            Image(systemName: "exclamationmark.triangle.fill")
                .font(.largeTitle)
                .foregroundColor(.app(.graySecondary))
            Text("No se encontraron productos")
                .font(.app(.montserratRegular, size: 16))
                .foregroundColor(.app(.graySecondary))
        }
        .padding(.top, 50)
    }
}
