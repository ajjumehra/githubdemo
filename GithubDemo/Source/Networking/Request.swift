//
//  Request.swift
//  GithubDemo
//
//  Created by Ajay Mehra on 31/07/22.
//

import Foundation

// MARK: - HTTPMethod

public enum HTTPMethod {
    case get
    case post
    case delete
    case put
}

public typealias Parameters = [String: Any]

// MARK: - Request

public struct Request {
    // MARK: Lifecycle

    public init(httpMethod: HTTPMethod, path: String, params: Parameters) {
        self.httpMethod = httpMethod
        self.path = path
        self.params = params
    }

    public init(httpMethod: HTTPMethod, path: String) {
        self.httpMethod = httpMethod
        self.path = path
        self.params = [:]
    }

    // MARK: Internal

    let httpMethod: HTTPMethod
    let path: String
    let params: Parameters
}

// MARK: - RequestBuilder

final class RequestBuilder {
    // TODO: - Request builder for other http method is also required
    func buildRequest(baseURL: String, request: Request) throws -> URLRequest {
        switch request.httpMethod {
            case .get:
                return try buildGet(baseURL: baseURL, request: request)
            case .post:
                return try buildPost(baseURL: baseURL, request: request)
            default:
                return try buildPost(baseURL: baseURL, request: request)
        }
    }
}

private extension RequestBuilder {
    func buildGet(baseURL: String, request: Request) throws -> URLRequest {
        let completeURL = completeURL(baseURL: baseURL, request: request)
        guard var components = URLComponents(string: completeURL) else {
            throw NetworkError.invalidURL
        }
        components.queryItems = request.params.compactMap {
            if let value = $0.value as? String {
                return URLQueryItem(name: $0.key, value: value)
            }
            return nil
        }

        guard let url = components.url else {
            throw NetworkError.invalidURL
        }

        return URLRequest(url: url)
    }

    private func buildPost(baseURL: String, request: Request) throws -> URLRequest {
        let completeURL = completeURL(baseURL: baseURL, request: request)
        guard let url = URL(string: completeURL) else {
            throw NetworkError.invalidURL
        }
        return URLRequest(url: url)
    }

    func completeURL(baseURL: String, request: Request) -> String {
        var completeURL = "\(baseURL)/\(request.path)"
        completeURL.replace(pattern: "[/]{2,}", with: "/")
        return completeURL
    }
}
