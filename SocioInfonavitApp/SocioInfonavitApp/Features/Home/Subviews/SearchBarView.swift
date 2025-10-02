//
//  SearchBarView.swift
//  SocioInfonavitApp
//
//  Created by Jesus Perez on 01/10/25.
//

import SwiftUI

struct SearchBarView: View {
    // MARK: - Properties

    @Binding var query: String

    // MARK: - View

    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.app(.graySecondary))

            TextField("Buscar producto...", text: $query)
                .textInputAutocapitalization(.none)
                .disableAutocorrection(true)
                .foregroundColor(.primary)

            if !query.isEmpty {
                Button(action: clearQuery) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.app(.graySecondary))
                }
            }
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 10)
        .background(Color.app(.backgroundSecondary))
        .cornerRadius(12)
    }

    // MARK: - Private Methods

    private func clearQuery() {
        query = ""
    }
}
