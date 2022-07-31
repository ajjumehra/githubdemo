//
//  String+Extension.swift
//  GithubDemo
//
//  Created by Ajay Mehra on 31/07/22.
//

import Foundation
public extension String {
    mutating func replace(pattern: String, with str: String) {
        do {
            let regex = try NSRegularExpression(pattern: pattern, options: .caseInsensitive)
            let range = NSRange(location: 0, length: count)
            self = regex.stringByReplacingMatches(in: self, options: [], range: range, withTemplate: str)
        } catch { return }
    }
}
