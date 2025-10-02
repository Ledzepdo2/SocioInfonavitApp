//
//  HomeViewModel.swift
//  SocioInfonavitApp
//
//  Created by Jesus Perez on 01/10/25.
//

import Combine
import Foundation

@MainActor
final class HomeViewModel: ObservableObject {
  // MARK: - Published State
  @Published var products: [Product] = []
  @Published var filteredProducts: [Product] = []
  @Published var isLoading: Bool = false
  @Published var query: String = "" {
    didSet { filterProducts() }
  }

  private let repository: HomeRepository
  private var cancellables = Set<AnyCancellable>()

  // MARK: - Init
  init(repository: HomeRepository = HomeRepository()) {
    self.repository = repository
  }

  // MARK: - Fetch Products
  func fetchProducts() {
    isLoading = true
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
