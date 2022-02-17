//
//  YampDataManager.swift
//  YampExample
//
//  Created by Cory Bechtel on 2/2/22.
//

import Foundation
import Yamp

class YampDataManager: DataManager, IYampDataManager {

    let cache: ICacheManager = CacheManager()

    var yampNetworkManager: IYampNetworkManager? {
        return networkManager as? IYampNetworkManager
    }

    func fetchPosts(completion: @escaping GetPostsCompletion) {
        yampNetworkManager?.getPosts(completion: { posts, error in
            if let posts = posts {
                completion(posts, error)
                self.cache.save(data: posts, key: .posts) //this will work for whole lists, not for items in a list, that would require a new mechanism to combine data sets
            }
            else if let posts = self.cache.load(key: .posts, type: [Post].self) {
                completion(posts, error)
            }
            else {
                completion(nil, error)
            }
        })
    }
}
