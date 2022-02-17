//
//  CacheManager.swift
//  SmokeTree
//
//  Created by Cory Bechtel on 1/21/21.
//  Copyright © 2021 Cory Bechtel. All rights reserved.
//

import Foundation

class CacheManager: ICacheManager {

    func save<T: Codable>(data: T, key: StorageKey) {
        print("Caching new result for \(key)")
        store(data, fileName: key.rawValue)
    }

    func load<T: Decodable>(key: StorageKey, type: T.Type) -> T? {
        return retrieve(key.rawValue, as: T.self)
    }

    /// Store an encodable struct to the documents directory on disk
    ///
    /// - Parameters:
    ///   - object: the encodable struct to store
    ///   - fileName: what to name the file where the struct data will be stored
    private func store<T: Encodable>(_ object: T, fileName: String) {
        let url = getDocumentsDirectory().appendingPathComponent(fileName, isDirectory: false)

        let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(object)
            if FileManager.default.fileExists(atPath: url.path) {
                try FileManager.default.removeItem(at: url)
            }
            FileManager.default.createFile(atPath: url.path, contents: data, attributes: nil)
        } catch {
            print(error.localizedDescription)
        }
    }

    /// Retrieve and convert a struct from a file on disk
    ///
    /// - Parameters:
    ///   - fileName: name of the file where struct data is stored
    ///   - type: struct type (i.e. Message.self)
    /// - Returns: decoded struct model(s) of data
    private func retrieve<T: Decodable>(_ fileName: String, as type: T.Type) -> T? {
        let url = getDocumentsDirectory().appendingPathComponent(fileName, isDirectory: false)

        if !FileManager.default.fileExists(atPath: url.path) {
            print("File at path \(url.path) does not exist!")
        }

        if let data = FileManager.default.contents(atPath: url.path) {
            let decoder = JSONDecoder()
            do {
                let model = try decoder.decode(type, from: data)
                return model
            } catch {
                print(error.localizedDescription)
            }
        } else {
            print("No data at \(url.path)!")
        }

        return nil
    }

    // MARK: HELPER
    private func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}

enum StorageKey: String {
    case posts = "posts"

}
