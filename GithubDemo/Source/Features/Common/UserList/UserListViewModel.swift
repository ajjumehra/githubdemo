//
//  UserListViewModel.swift
//  GithubDemo
//
//  Created by Ajay Mehra on 31/07/22.
//

import Foundation
import SwiftUI

class UserListViewModel: ObservableObject {
    @Published var users: [ProfileViewModel] = []
    var grids: [GridItem] {
        Array(repeating: .init(.fixed(UIScreen.main.bounds.width / 2 - 20), spacing: 16), count: 2)
    }

}
