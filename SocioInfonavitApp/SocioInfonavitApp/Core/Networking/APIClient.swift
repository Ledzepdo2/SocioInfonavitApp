//
//  APIClient.swift
//  SocioInfonavitApp
//
//  Created by Jesus Perez on 01/10/25.
//

import Foundation
import Alamofire

final class APIClient {
    static let shared = APIClient()
    private init() {}

    private let session: Session = {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 30
        configuration.timeoutIntervalForResource = 60
        return Session(configuration: configuration)
    }()

    func request<T: Decodable>(
        _ convertible: URLRequestConvertible,
        decoder: JSONDecoder = JSONDecoder()
    ) async throws -> T {
        return try await withCheckedThrowingContinuation { continuation in
            session.request(convertible)
                .validate(statusCode: 200..<300)
                .responseDecodable(of: T.self, decoder: decoder) { response in
                    switch response.result {
                    case .success(let value):
                        continuation.resume(returning: value)
                    case .failure(let afError):
                        let appError = self.mapError(response: response, error: afError)
                        continuation.resume(throwing: appError)
                    }
                }
        }
    }

    private func mapError<T>(
        response: AFDataResponse<T>,
        error: AFError
    ) -> AppError {
        if let statusCode = response.response?.statusCode {
            switch statusCode {
            case 400...499:
                return .validation(message: "Error de validación")
            case 500...599:
                return .server(message: "Error en el servidor")
            default:
                return .network(message: "Error de red con código: \(statusCode)")
            }
        }

        if error.isSessionTaskError {
            return .network(message: "Error de conexión con el servidor")
        }

        return .unknown
    }
}
