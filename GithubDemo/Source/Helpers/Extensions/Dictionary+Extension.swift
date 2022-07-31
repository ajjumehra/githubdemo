//
//  Dictionary+Extension.swift
//  GithubDemo
//
//  Created by Ajay Mehra on 31/07/22.
//

import Foundation
extension Dictionary {
    var queryString: String {
        self.compactMap {
            "\($0)=\($1)"
        }.joined(separator: "&")
    }
}
