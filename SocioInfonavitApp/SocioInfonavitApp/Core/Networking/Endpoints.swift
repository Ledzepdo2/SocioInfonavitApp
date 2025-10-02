//
//  Endpoints.swift
//  SocioInfonavitApp
//
//  Created by Jesus Perez on 01/10/25.
//

import Alamofire
import Foundation

enum Endpoints: URLRequestConvertible {
    // MARK: - Constants

    static let baseURL = "https://api.escuelajs.co/api/v1"

    // MARK: - Cases

    case products
    case product(id: Int)
    case categories

    // MARK: - HTTP Method

    var method: HTTPMethod {
        switch self {
        case .products, .product, .categories:
            return .get
        }
    }

    // MARK: - Path

    var path: String {
        switch self {
        case .products:
            return "/products"
        case let .product(id):
            return "/products/\(id)"
        case .categories:
            return "/categories"
        }
    }

    // MARK: - URLRequestConvertible

    func asURLRequest() throws -> URLRequest {
        let url = try Endpoints.baseURL.asURL()
        var request = URLRequest(url: url.appendingPathComponent(path))
        request.method = method
        return request
    }
}
