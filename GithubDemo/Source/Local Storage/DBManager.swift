//
//  DBManager.swift
//  GithubDemo
//
//  Created by Ajay Mehra on 31/07/22.
//

import Foundation

// MARK: - DBManagerType

public protocol DBManagerType {
    func fetch<Response: Codable>(key: String) -> Response?
    func save<Response: Codable>(key: String, object: Response)
}

// MARK: - DBManager

class DBManager: DBManagerType {
    func save<Response>(key: String, object: Response) where Response : Decodable, Response : Encodable {
        UserDefaults.standard.setObject(object, forKey: key)
    }

    func fetch<Response>(key: String) -> Response? where Response: Codable {
        UserDefaults.standard.fetchObject(dataType: Response.self, key: key)
    }
}

extension UserDefaults {
    func setObject<T: Codable>(_ data: T?, forKey defaultName: String) {
        let encoded = try? JSONEncoder().encode(data)
        set(encoded, forKey: defaultName)
    }

    func fetchObject<T: Codable>(dataType: T.Type, key: String) -> T? {
        guard let userDefaultData = data(forKey: key) else {
            return nil
        }
        return try? JSONDecoder().decode(T.self, from: userDefaultData)
    }
}
