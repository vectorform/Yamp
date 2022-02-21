//
//  YampNetworkManager.swift
//  YampExample
//
//  Created by Cory Bechtel on 2/2/22.
//

import Foundation
import Yamp

typealias GetPostsCompletion = ([Post]?, ApiReturn?) -> Void

class YampNetworkManager: NetworkManager, IYampNetworkManager {

    func getPosts(completion: @escaping GetPostsCompletion)  {
        // Case 1: Simple
        callToPath(path: "posts", verb: .get, parameters: nil) { data, apiReturn in
            if let data = data, let posts = try? JSONDecoder().decode([Post].self, from: data) {
                completion(posts, apiReturn)
            }
            else {
                completion(nil, apiReturn)
            }
        }

        // Case 2: Simple parsed, that doesn't work
//        callToPathParsed<[Post]>(path: "posts", verb: .get, parameters: nil) { posts, data, error in
//
//        }

        // Case 3: inner function to allow generics to work.
//        callToPathParsed(path: "posts", verb: .get, parameters: nil, completion: postReturn)
//
//        func postReturn(posts: [Post]?, data: Data?, error: Error?) {
//            completion(posts, nil)
//            print(posts)
//        }
    }
}
