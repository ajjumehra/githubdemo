//
//  SearchUserNetwork.swift
//  GithubDemo
//
//  Created by Ajay Mehra on 31/07/22.
//

import Combine
import Foundation

// MARK: - SearchUserNetworkType

protocol SearchUserNetworkType {
    func search(username: String) -> AnyPublisher<UserSearchResponse, Error>
}

// MARK: - SearchUserNetwork

class SearchUserNetwork: SearchUserNetworkType {
    func search(username: String) -> AnyPublisher<UserSearchResponse, Error> {
        let request: Request = .init(httpMethod: .get, path: APIEndPoint.searchUser.rawValue, params: ["q": username])
        return networkClient.request(request: request)
    }

    // MARK: Lifecycle

    init(networkClient: NetworkClientType) {
        self.networkClient = networkClient
    }

    // MARK: Internal

    let networkClient: NetworkClientType
}
