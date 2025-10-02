//
//  HomeRepository.swift
//  SocioInfonavitApp
//
//  Created by Jesus Perez on 01/10/25.
//

import Foundation

final class HomeRepository {
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
