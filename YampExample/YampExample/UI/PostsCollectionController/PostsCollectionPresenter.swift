//
//  PostsCollectionPresenter.swift
//  YampExample
//
//  Created by Cory Bechtel on 2/10/22.
//

import Foundation

class PostsCollectionPresenter: BasePresenter, IPostsCollectionPresenter {

    private weak var myView: PostsCollectionViewController? {
        return self.view as? PostsCollectionViewController
    }

    func fetchPosts() {
        let useCase = FetchPostsUseCase()
        useCase.invoke { result in
            switch result {
            case let .success(posts):
                self.myView?.displayPosts(posts: posts)
            case let .failure(error):
                print("Error \(error)")
            }
        }
    }
}
