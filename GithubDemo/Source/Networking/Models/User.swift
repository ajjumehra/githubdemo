//
//  User.swift
//  GithubDemo
//
//  Created by Ajay Mehra on 30/07/22.
//

import Foundation

// MARK: - User

struct User: Codable, Identifiable, Equatable {
    let login: String?
    let id: Int
    let nodeID: String?
    let avatarURL: String?
    let gravatarID: String?
    let url, htmlURL, followersURL: String?
    let followingURL, gistsURL, starredURL: String?
    let subscriptionsURL, organizationsURL, reposURL: String?
    let eventsURL: String?
    let receivedEventsURL: String?
    let type: String?
    let siteAdmin: Bool?
    let score: Double?

    enum CodingKeys: String, CodingKey {
        case login
        case id
        case nodeID = "node_id"
        case avatarURL = "avatar_url"
        case gravatarID = "gravatar_id"
        case url
        case htmlURL = "html_url"
        case followersURL = "followers_url"
        case followingURL = "following_url"
        case gistsURL = "gists_url"
        case starredURL = "starred_url"
        case subscriptionsURL = "subscriptions_url"
        case organizationsURL = "organizations_url"
        case reposURL = "repos_url"
        case eventsURL = "events_url"
        case receivedEventsURL = "received_events_url"
        case type
        case siteAdmin = "site_admin"
        case score
    }
    
}

/// Mocked Object for preview
extension User {
    static var preview: User {
        .init(login: "ram123", id: .random(in: 0...20), nodeID: "jhjdf", avatarURL: "https://avatars.githubusercontent.com/u/7347118?v=4", gravatarID: nil, url: nil, htmlURL: nil, followersURL: nil, followingURL: nil, gistsURL: nil, starredURL: nil, subscriptionsURL: nil, organizationsURL: nil, reposURL: nil, eventsURL: nil, receivedEventsURL: nil, type: nil, siteAdmin: false, score: 1.0)
    }
}
