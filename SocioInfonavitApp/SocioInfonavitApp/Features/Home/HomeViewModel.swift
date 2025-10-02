import Combine
import Foundation

// MARK: - HomeViewModel

@MainActor
final class HomeViewModel: ObservableObject {
  // MARK: - Published State
  @Published var products: [Product] = []
  @Published var filteredProducts: [Product] = []
  @Published var isLoading: Bool = false
  @Published var query: String = "" {
    didSet { filterProducts() }
  }
  @Published var showingBenevits: Bool = false

  private let repository: HomeRepository
  private var cancellables = Set<AnyCancellable>()

  // MARK: - Init
  init(repository: HomeRepository = HomeRepository()) {
    self.repository = repository
  }

  // MARK: - Fetch Products
  func fetchProducts() {
    isLoading = true
    showingBenevits = false
    Task {
      do {
        try await Task.sleep(nanoseconds: 2_000_000_000)

        let result = try await repository.fetchProducts()
        products = result
        filteredProducts = result

        isLoading = false
      } catch {
        isLoading = false
        if let appError = error as? AppError {
          AppErrorManager.shared.present(error: appError)
        } else {
          AppErrorManager.shared.present(error: .unknown)
        }
      }
    }
  }

  // MARK: - Filter
  private func filterProducts() {
    guard !query.isEmpty else {
      filteredProducts = products
      return
    }

    filteredProducts = products.filter { product in
      product.title.localizedCaseInsensitiveContains(query)
        || product.description.localizedCaseInsensitiveContains(query)
    }
  }
}

extension HomeViewModel {
  // MARK: - Load Benevits (Mock)

  func loadMockBenevits() {
    showingBenevits = true

    let mockProducts: [Product] = [
      Product(
        id: 101,
        title: "Cinépolis",
        slug: "cinepolis",
        price: 0,
        description: "2x1 en boletos",
        category: Category(id: 1, name: "Entretenimiento", image: "", slug: "movies"),
        images: ["https://www.quadratin.com.mx/www/wp-content/uploads/2019/06/8PZrz5Ka.png"],
        isLocked: false
      ),
      Product(
        id: 102,
        title: "Starbucks",
        slug: "starbucks",
        price: 0,
        description: "10% descuento",
        category: Category(id: 2, name: "Café", image: "", slug: "coffee"),
        images: ["https://media.informabtl.com/wp-content/uploads/2016/02/Logo-Starbucks-.jpg"],
        isLocked: true
      ),
      Product(
        id: 103,
        title: "Uber",
        slug: "uber",
        price: 0,
        description: "15% en viajes",
        category: Category(id: 3, name: "Transporte", image: "", slug: "transport"),
        images: ["https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSfUaxpCrhNXI2OTa5Dp1dg4fIXvD9dkYwW9A&s"],
        isLocked: false
      ),
      Product(
        id: 104,
        title: "Rappi",
        slug: "rappi",
        price: 0,
        description: "Envío gratis",
        category: Category(id: 4, name: "Delivery", image: "", slug: "delivery"),
        images: [
          "https://yt3.googleusercontent.com/_dwYwYDHQAJYdQ5C1Idara9Mi1Oh0SthWv3pCqC6ShC9WpgGPfdRaS1lI-sa6VoWOpfVjdmgAQY=s900-c-k-c0x00ffffff-no-rj"
        ],
        isLocked: true
      )
    ]

    products = mockProducts
    filteredProducts = mockProducts
  }
}
