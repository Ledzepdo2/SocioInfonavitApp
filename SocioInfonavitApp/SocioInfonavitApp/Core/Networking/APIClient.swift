//
//  APIClient.swift
//  SocioInfonavitApp
//
//  Created by Jesus Perez on 01/10/25.
//

import Alamofire
import Foundation

final class APIClient {
    // MARK: - Singleton

    static let shared = APIClient()

    // MARK: - Private Properties

    private let session: Session = {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 30
        configuration.timeoutIntervalForResource = 60
        return Session(configuration: configuration)
    }()

    // MARK: - Initialization

    private init() {}

    // MARK: - Public Methods

    func request<T: Decodable>(
        _ convertible: URLRequestConvertible,
        decoder: JSONDecoder = JSONDecoder()
    ) async throws -> T {
        try await withCheckedThrowingContinuation { continuation in
            session.request(convertible)
                .validate(statusCode: 200 ..< 300)
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

    // MARK: - Private Methods

    private func mapError<T>(
        response: AFDataResponse<T>,
        error: AFError
    ) -> AppError {
        if let statusCode = response.response?.statusCode {
            switch statusCode {
            case 400 ... 499:
                return .validation(message: "Error de validación")
            case 500 ... 599:
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
