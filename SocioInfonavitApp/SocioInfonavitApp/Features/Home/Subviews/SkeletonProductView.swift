//
//  SkeletonProductView.swift
//  SocioInfonavitApp
//
//  Created by Jesus Perez on 01/10/25.
//

import SwiftUI

struct SkeletonProductView: View {
  var body: some View {
    VStack(alignment: .leading, spacing: 8) {
      Rectangle()
        .fill(Color.gray.opacity(0.2))
        .frame(height: 180)
        .cornerRadius(12)
        .shimmer()

      Rectangle()
        .fill(Color.gray.opacity(0.2))
        .frame(height: 20)
        .cornerRadius(6)
        .shimmer()

      Rectangle()
        .fill(Color.gray.opacity(0.2))
        .frame(width: 100, height: 20)
        .cornerRadius(6)
        .shimmer()
    }
    .padding(.horizontal)
  }
}
