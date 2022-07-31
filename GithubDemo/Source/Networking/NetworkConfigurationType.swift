//
//  NetworkConfigurationType.swift
//  GithubDemo
//
//  Created by Ajay Mehra on 31/07/22.
//

import Combine
import Foundation

// MARK: - NetworkConfigurationType

public protocol NetworkConfigurationType {
    var baseURL: String? { get set }
}

// MARK: - NetworkConfiguration

public class NetworkConfiguration: NetworkConfigurationType {
    // MARK: Lifecycle

    init(baseURL: String) {
        self.baseURL = baseURL
    }

    // MARK: Public

    public var baseURL: String?
}
