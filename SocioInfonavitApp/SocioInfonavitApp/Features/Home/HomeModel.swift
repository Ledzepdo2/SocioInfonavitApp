// MARK: - Product
struct Product: Decodable, Identifiable {
  let id: Int
  let title: String
  let slug: String
  let price: Double
  let description: String
  let category: Category
  let images: [String]
    
  var isLocked: Bool? = nil
}

// MARK: - Category
struct Category: Decodable, Identifiable {
  let id: Int
  let name: String
  let image: String
  let slug: String
}
