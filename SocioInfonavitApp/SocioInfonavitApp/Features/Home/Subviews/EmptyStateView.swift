import SwiftUI

// MARK: - EmptyStateView

struct EmptyStateView: View {
  // MARK: - Body

  var body: some View {
    VStack(spacing: 12) {
      Image(systemName: "exclamationmark.triangle.fill")
        .font(.largeTitle)
        .foregroundColor(.app(.graySecondary))
      Text("home.emptyState.message")
        .font(.app(.montserratRegular, size: 16))
        .foregroundColor(.app(.graySecondary))
    }
    .padding(.top, 50)
  }
}
