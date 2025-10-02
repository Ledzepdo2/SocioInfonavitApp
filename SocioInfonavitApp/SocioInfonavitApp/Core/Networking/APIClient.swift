import Alamofire
import Foundation

// MARK: - APIClient

final class APIClient {
  // MARK: - Singleton

  static let shared = APIClient()
  private init() {}

  // MARK: - Properties

  private let session: Session = {
    let configuration = URLSessionConfiguration.default
    configuration.timeoutIntervalForRequest = 30
    configuration.timeoutIntervalForResource = 60
    return Session(configuration: configuration)
  }()

  // MARK: - Requests

  func request<T: Decodable>(
    _ convertible: URLRequestConvertible,
    decoder: JSONDecoder = JSONDecoder()
  ) async throws -> T {
    try await withCheckedThrowingContinuation { continuation in
      session.request(convertible)
        .validate(statusCode: 200..<300)
        .responseDecodable(of: T.self, decoder: decoder) { response in
          switch response.result {
          case let .success(value):
            continuation.resume(returning: value)
          case let .failure(afError):
            let appError = self.mapError(response: response, error: afError)
            continuation.resume(throwing: appError)
          }
        }
    }
  }

  // MARK: - Error Mapping

  private func mapError<T>(
    response: AFDataResponse<T>,
    error: AFError
  ) -> AppError {
    if let statusCode = response.response?.statusCode {
      switch statusCode {
      case 400...499:
        return .validation(message: String(localized: "network.error.validation"))
      case 500...599:
        return .server(message: String(localized: "network.error.server"))
      default:
        return .network(
          message: String(
            format: String(localized: "network.error.statusCode"),
            statusCode
          )
        )
      }
    }

    if error.isSessionTaskError {
      return .network(message: String(localized: "network.error.connection"))
    }

    return .unknown
  }
}
