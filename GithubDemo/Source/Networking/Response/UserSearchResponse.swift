//
//  UserSearchResponse.swift
//  GithubDemo
//
//  Created by Ajay Mehra on 30/07/22.
//

import Foundation

struct UserSearchResponse: Decodable {
    let totalCount: Int?
    let incompleteResults: Bool?
    let items: [User]?

    enum CodingKeys: String, CodingKey {
        case totalCount = "total_count"
        case incompleteResults = "incomplete_results"
        case items
    }
}
