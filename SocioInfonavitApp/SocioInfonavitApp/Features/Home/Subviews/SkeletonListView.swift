import SwiftUI

// MARK: - SkeletonListView

struct SkeletonListView: View {
  // MARK: - Body

  var body: some View {
    ScrollView {
      LazyVStack(spacing: 16) {
        ForEach(0..<6, id: \.self) { _ in
          SkeletonProductView()
        }
      }
      .padding()
    }
  }
}
