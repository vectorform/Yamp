//
//  PostViewModel.swift
//  YampExample
//
//  Created by Cory Bechtel on 2/10/22.
//

import Foundation

struct PostViewModel {

    let title: String
    let body: String
    let id: Int
    let userID: Int

    init(post: Post) {
        self.title = post.title
        self.body = post.body
        self.id = post.id
        self.userID = post.userId
    }
}

extension Array where Element == Post {

    func asViewModel() -> [PostViewModel] {
        var simpleModels: [PostViewModel] = []

        for post in self {
            simpleModels.append(PostViewModel(post: post))
        }

        return simpleModels
    }
}
