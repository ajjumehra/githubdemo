//
//  SearchUserView.swift
//  GithubDemo
//
//  Created by Ajay Mehra on 31/07/22.
//

import SwiftUI

// MARK: - SearchUserView

struct SearchUserView: View {
    @ObservedObject var viewModel: SearchUserViewModel = .init()
    var body: some View {
        ZStack(alignment: .topLeading) {
            VStack(alignment: .leading) {
                Spacer().frame(height: 44)
                searchBar
                ScrollView {
                    UserListView(viewModel: viewModel.userListViewModel)
                }
                Spacer()
            }
        }
    }

    var searchBar: some View {
        HStack(spacing: 16) {
            TextField("User Name", text: $viewModel.searchString)
                .padding()
            Button("Search", action: viewModel.search)
                .padding(.trailing, 16)
        }
        .font(.system(size: 16, weight: .medium))
        .foregroundColor(.gray)
        .background(
            RoundedRectangle(cornerRadius: 8)
                .stroke(.gray, lineWidth: 2)
        )
        .padding()
    }
}

// MARK: - SearchUserView_Previews

struct SearchUserView_Previews: PreviewProvider {
    static var previews: some View {
        SearchUserView()
    }
}
