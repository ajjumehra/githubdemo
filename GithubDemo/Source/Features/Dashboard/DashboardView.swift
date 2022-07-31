//
//  DashboardView.swift
//  GithubDemo
//
//  Created by Ajay Mehra on 30/07/22.
//

import SwiftUI

// MARK: - DashboardView

struct DashboardView: View {
    @ObservedObject var viewModel: DashboardViewModel = .init(profileViewModel: .init(user: .preview))
    var body: some View {
        NavigationStack {
            ZStack(alignment: .topLeading) {
                VStack(alignment: .leading) {
                    Spacer().frame(height: 44)
                    recentSearches
                    Spacer()
                }

                .toolbar {
                    HStack {
                        avatar
                        Spacer()
                        searchIcon
                    }
                    .font(.system(size: 32))
                }
            }
            .onAppear(perform: viewModel.getRecentSearchHistory)
        }
    }

    @ViewBuilder var avatar: some View {
        AsyncImage(url: viewModel.profileViewModel.avatarURL) { image in
            image.resizable()
        } placeholder: {
            Image(systemName: "person.crop.circle.fill")
                .font(.system(size: 30))
        }
        .frame(width: 50, height: 50)
        .clipShape(Circle())
    }

    var recentSearches: some View {
        VStack(alignment: .leading, spacing: 16) {
          header
            ScrollView {
                UserListView(viewModel: viewModel.userListViewModel)
            }
        }
        .padding(.horizontal, 16)
    }

    var header: some View {
        HStack(alignment: .center, spacing: 16) {
            Text("Recent Searches")
                .font(.system(size: 32, weight: .bold))
                .foregroundColor(.indigo)
            Spacer()
            Button("Clear", action: viewModel.clear)
                .font(.system(size: 22, weight: .bold))
                .foregroundColor(.red)
        }
        .padding(.horizontal, 16)
    }

    var searchIcon: some View {
        NavigationLink {
            SearchUserView()
        } label: {
            Image(systemName: "magnifyingglass.circle.fill")
        }.foregroundColor(.gray)
    }
}

// MARK: - DashboardView_Previews

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
