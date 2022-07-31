//
//  SearchUserViewModel.swift
//  GithubDemo
//
//  Created by Ajay Mehra on 31/07/22.
//

import Combine
import Foundation
import SwiftUI

// MARK: - SearchUserViewModel

class SearchUserViewModel: ObservableObject {
    @ObservedObject var userListViewModel: UserListViewModel = .init()
    @Published var searchString: String = ""
    let dbManager: DBManagerType = DBManager()
    var searchUseCase = UserSearchFactory.searchUseCase()
    private var cancellable: AnyCancellable?

    func search() {
        cancellable = searchUseCase.search(username: searchString).receive(on: DispatchQueue.main).sink { _ in

        } receiveValue: { [self] users in
            userListViewModel.users = users.compactMap { .init(user: $0) }
            saveSearch(users: users)
        }
    }

    func saveSearch(users: [User]) {
        guard var savedUsers: [User] = dbManager.fetch(key: "recentSearches") else {
            dbManager.save(key: "recentSearches", object: users)
            return
        }
        savedUsers += users
        dbManager.save(key: "recentSearches", object: savedUsers.unique)
    }
}

// MARK: - UserSearchFactory

enum UserSearchFactory {
    static func searchUseCase() -> SearchUserUseCaseType {
        let searchNetworkClient: SearchUserNetwork = .init(networkClient: RestClientFactory.restClient())
        let searchUseCase: SearchUserUseCase = .init(networkClient: searchNetworkClient)
        return searchUseCase
    }
}

// MARK: - RestClientFactory

enum RestClientFactory {
    static func restClient() -> NetworkClientType {
        // TODO: - Configuration and mocking should be handled at App level
        let configuration: NetworkConfiguration = .init(baseURL: NetworkConstants.baseURL.rawValue)
        let restClient: RestNetworkClient = .init(configuration: configuration)
        return restClient
    }
}
