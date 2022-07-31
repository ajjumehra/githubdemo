//
//  UserListView.swift
//  GithubDemo
//
//  Created by Ajay Mehra on 31/07/22.
//

import SwiftUI

// MARK: - UserListView

struct UserListView: View {
    @ObservedObject var viewModel: UserListViewModel
    var body: some View {
        LazyVGrid(columns: viewModel.grids, spacing: 20) {
            ForEach(viewModel.users) { item in
                NavigationLink {
                    WebView(url: item.profileURL)
                } label: {
                    UserCell(viewModel: item)
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(.gray, lineWidth: 2)
                        )
                }
            }
        }
        .frame(maxWidth: .infinity, alignment: .center)
    }
}

// MARK: - UserListView_Previews

struct UserListView_Previews: PreviewProvider {
    static var previews: some View {
        UserListView(viewModel: .init())
    }
}
