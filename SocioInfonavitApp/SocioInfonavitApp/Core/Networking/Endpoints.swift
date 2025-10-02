import Alamofire
import Foundation

// MARK: - Endpoints

enum Endpoints: URLRequestConvertible {
  static let baseURL = "https://api.escuelajs.co/api/v1"

  case products
  case product(id: Int)
  case categories

  var method: HTTPMethod {
    switch self {
    case .products, .product, .categories:
      return .get
    }
  }

  var path: String {
    switch self {
    case .products: return "/products"
    case .product(let id): return "/products/\(id)"
    case .categories: return "/categories"
    }
  }

  func asURLRequest() throws -> URLRequest {
    let url = try Endpoints.baseURL.asURL()
    var request = URLRequest(url: url.appendingPathComponent(path))
    request.method = method
    return request
  }
}
