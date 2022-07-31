//
//  SearchUserUseCase.swift
//  GithubDemo
//
//  Created by Ajay Mehra on 31/07/22.
//

import Combine
import Foundation

// MARK: - SearchUserUseCaseType

protocol SearchUserUseCaseType {
    func search(username: String) -> AnyPublisher<[User], Error>
}

// MARK: - SearchUserUseCase

class SearchUserUseCase: SearchUserUseCaseType {
    func search(username: String) -> AnyPublisher<[User], Error> {
        networkClient.search(username: username).map { $0.items ?? [] }.eraseToAnyPublisher()
    }

    // MARK: Lifecycle

    init(networkClient: SearchUserNetworkType) {
        self.networkClient = networkClient
    }

    private let networkClient: SearchUserNetworkType
}
