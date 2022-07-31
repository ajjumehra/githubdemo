//
//  NetworkClientType.swift
//  GithubDemo
//
//  Created by Ajay Mehra on 31/07/22.
//

import Combine
import Foundation

public protocol NetworkClientType {
    func request<Response: Decodable>(request: Request) -> AnyPublisher<Response, Error>
}
