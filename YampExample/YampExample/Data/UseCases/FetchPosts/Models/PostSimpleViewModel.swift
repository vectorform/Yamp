//
//  PostSimpleViewModel.swift
//  YampExample
//
//  Created by Cory Bechtel on 2/10/22.
//

import Foundation

struct PostSimpleViewModel {

    let title: String
    let body: String
    let id: Int

    init(post: Post) {
        self.title = post.title
        self.body = post.body
        self.id = post.id
    }
}

extension Array where Element == Post {

    func asSimpleViewModel() -> [PostSimpleViewModel] {
        var simpleModels: [PostSimpleViewModel] = []

        for post in self {
            simpleModels.append(PostSimpleViewModel(post: post))
        }

        return simpleModels
    }
}
