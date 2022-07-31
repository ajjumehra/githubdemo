//
//  UserCell.swift
//  GithubDemo
//
//  Created by Ajay Mehra on 30/07/22.
//

import SwiftUI

// MARK: - UserCell

struct UserCell: View {
    var viewModel: ProfileViewModel
    var body: some View {
        HStack(alignment: .top, spacing: 16) {
            avatar
            userInfo
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 8)
        .frame(maxWidth: .infinity, alignment: .leading)
    }

    @ViewBuilder var avatar: some View {
        AsyncImage(url: viewModel.avatarURL) { image in
            image.resizable()
                .frame(width: 70, height: 70)
        } placeholder: {
            Image(systemName: "person.crop.circle.fill")
                .font(.system(size: 80))

        }
        .clipShape(Circle())
    }
    @ViewBuilder var userInfo: some View {
        VStack(alignment: .leading) {
            Text(viewModel.displayUserName)
                .font(.system(size: 22, weight: .medium))
                .padding(.vertical, 5)
            Text(viewModel.userScore)
                .font(.system(size: 18, weight: .regular))
        }
    }
}

// MARK: - UserCell_Previews

struct UserCell_Previews: PreviewProvider {
    static var previews: some View {
        UserCell(viewModel: .init(user: .preview))
            .previewLayout(.sizeThatFits)
    }
}
