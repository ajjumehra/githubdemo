//
//  ProfileViewModel.swift
//  GithubDemo
//
//  Created by Ajay Mehra on 30/07/22.
//

import Foundation

// MARK: - ProfileViewModel

class ProfileViewModel: ObservableObject, Identifiable {
    private var user: User
    var id: Int {
        user.id
    }

    init(user: User) {
        self.user = user
    }

    var avatarURL: URL? {
        guard let avatar = user.avatarURL, let imageURL = URL(string: avatar) else {
            return nil
        }
        return imageURL
    }

    var profileURL: URL? {
        guard let htmlURL = user.htmlURL, let profileURL = URL(string: htmlURL) else {
            return nil
        }
        return profileURL
    }

    var displayUserName: String {
        guard let userName = user.login else {
            return "N-A"
        }
        return userName
    }

    var userScore: String {
        guard let score = user.score else {
            return "-"
        }
        return "\(score)"
    }
}
