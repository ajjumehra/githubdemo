//
//  Array+Extension.swift
//  GithubDemo
//
//  Created by Ajay Mehra on 31/07/22.
//

import Foundation
extension Array where Element: Equatable {
    var unique: [Element] {
        var uniqueValues: [Element] = []
        forEach { item in
            guard !uniqueValues.contains(item) else {
                return
            }
            uniqueValues.append(item)
        }
        return uniqueValues
    }
}
