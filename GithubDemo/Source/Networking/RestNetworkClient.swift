//
//  RestNetworkClient.swift
//  GithubDemo
//
//  Created by Ajay Mehra on 31/07/22.
//

import Combine
import Foundation

final class RestNetworkClient: NetworkClientType {
    // MARK: Lifecycle

    init(configuration: NetworkConfigurationType) {
        networkConfiguration = configuration
        baseURL = networkConfiguration.baseURL
        sessionManager = .shared
        requestBuilder = .init()
        dispatchQueue = .init(label: "networking", qos: .background, attributes: .concurrent)
    }

    // MARK: Internal

    var baseURL: String?

    func request<Response>(request: Request) -> AnyPublisher<Response, Error> where Response: Decodable {
        guard let baseURL = baseURL else {
            return Fail<Response, Error>(error: NetworkError.invalidURL).eraseToAnyPublisher()
        }
        let urlRequest: URLRequest

        do {
            urlRequest = try requestBuilder.buildRequest(baseURL: baseURL, request: request)
        } catch {
            return Fail<Response, Error>(error: NetworkError.invalidURL).eraseToAnyPublisher()
        }
        return sessionManager.dataTaskPublisher(for: urlRequest)
            .tryMap { output in
                // TODO: -  Need to handle HTTP Status Code
                guard output.response is HTTPURLResponse else {
                    throw NetworkError.invalidResponse
                }
                return output.data
            }
            .decode(type: Response.self, decoder: JSONDecoder())
            .mapError { _ in
                // TODO: - Need to handle Different network error cases
                NetworkError.invalidResponse
            }
            .eraseToAnyPublisher()
    }

    // MARK: Private

    private let networkConfiguration: NetworkConfigurationType
    private let sessionManager: URLSession
    private let requestBuilder: RequestBuilder
    private let dispatchQueue: DispatchQueue
}
