//
//  PostsPresenter.swift
//  YampExample
//
//  Created by Cory Bechtel on 2/3/22.
//

import Foundation

class PostsPresenter: BasePresenter, IPostsPresenter {

    private weak var myView: PostsViewController? {
        return self.view as? PostsViewController
    }

    func fetchPosts() {
        let useCase = FetchSimplePostsUseCase()
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
