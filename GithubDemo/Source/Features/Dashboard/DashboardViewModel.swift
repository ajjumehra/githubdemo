//
//  DashboardViewModel.swift
//  GithubDemo
//
//  Created by Ajay Mehra on 30/07/22.
//

import Foundation
import SwiftUI

// MARK: - DashboardNavigation

enum DashboardNavigation {
    case search
    case profile
}

// MARK: - DashboardViewModel

/// This class will handle the logical operation for Dashboard
// TODO: - DB data should managed with local data base like core data or sql
class DashboardViewModel: ObservableObject {
    @ObservedObject var userListViewModel: UserListViewModel = .init()
    let dbManager: DBManagerType = DBManager()
    let profileViewModel: ProfileViewModel

    init(profileViewModel: ProfileViewModel) {
        self.profileViewModel = profileViewModel
    }

    func getRecentSearchHistory() {
        guard let users: [User] = dbManager.fetch(key: "recentSearches") else {
            return
        }

        userListViewModel.users = users.compactMap { .init(user: $0) }
    }

    func clear() {
        UserDefaults.standard.removeObject(forKey: "recentSearches")
        userListViewModel.users = []
    }
}
