import Foundation

// MARK: - HomeRepository

final class HomeRepository {
  // MARK: - Requests

  func fetchProducts() async throws -> [Product] {
    try await APIClient.shared.request(Endpoints.products)
  }

  func fetchProduct(id: Int) async throws -> Product {
    try await APIClient.shared.request(Endpoints.product(id: id))
  }

  func fetchCategories() async throws -> [Category] {
    try await APIClient.shared.request(Endpoints.categories)
  }
}
