//
//  ICacheManager.swift
//  SmokeTree
//
//  Created by Cory Bechtel on 1/21/21.
//  Copyright © 2021 Cory Bechtel. All rights reserved.
//

import Foundation

protocol ICacheManager {
    func save<T: Codable>(data: T, key: StorageKey)
    func load<T: Decodable>(key: StorageKey, type: T.Type) -> T?
}
