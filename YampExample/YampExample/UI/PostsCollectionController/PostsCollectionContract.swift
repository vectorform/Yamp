//
//  PostsCollectionContract.swift
//  YampExample
//
//  Created by Cory Bechtel on 2/10/22.
//

import Foundation

protocol IPostsCollectionViewController: IBaseViewController {
    func displayPosts(posts: [PostViewModel]?)
}

protocol IPostsCollectionPresenter: IBasePresenter {
    func fetchPosts()
}
