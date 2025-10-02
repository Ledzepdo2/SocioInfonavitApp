//
//  HomeModel.swift
//  SocioInfonavitApp
//
//  Created by Jesus Perez on 01/10/25.
//

// MARK: - Product
struct Product: Decodable, Identifiable {
  let id: Int
  let title: String
  let slug: String
  let price: Double
  let description: String
  let category: Category
  let images: [String]
}

// MARK: - Category
struct Category: Decodable, Identifiable {
  let id: Int
  let name: String
  let image: String
  let slug: String
}
