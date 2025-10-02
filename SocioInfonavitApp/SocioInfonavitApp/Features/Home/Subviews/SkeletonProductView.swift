import SwiftUI

// MARK: - SkeletonProductView

struct SkeletonProductView: View {
  // MARK: - Body

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
