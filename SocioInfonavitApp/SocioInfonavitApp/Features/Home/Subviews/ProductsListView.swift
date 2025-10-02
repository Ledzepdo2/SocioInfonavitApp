import SwiftUI

// MARK: - ProductsListView

struct ProductsListView: View {
  // MARK: - Properties

  @ObservedObject var viewModel: HomeViewModel

  // MARK: - Body

  var body: some View {
    ScrollView(.vertical, showsIndicators: false) {
      VStack(alignment: .leading, spacing: 32) {
        ProductsSectionView(
          title: String(localized: "home.products.section.home"),
          products: viewModel.products
        ) { product in
          print("Tapped: \(product.title)")
        }

        ProductsSectionView(
          title: String(localized: "home.products.section.other"),
          products: viewModel.products
        ) { product in
          print("Tapped: \(product.title)")
        }
      }
      .padding(.vertical)
    }
  }
}
