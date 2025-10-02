import SwiftUI

// MARK: - BenevitsListView

struct BenevitsListView: View {
  // MARK: - Properties

  @ObservedObject var viewModel: HomeViewModel

  // MARK: - Body

  var body: some View {
    VStack(alignment: .leading, spacing: 12) {
      Text("home.benevits.title")
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
                  error: .validation(
                    message: String(localized: "home.benevits.error.locked")
                  )
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
