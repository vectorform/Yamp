//
//  PostsContract.swift
//  YampExample
//
//  Created by Cory Bechtel on 2/3/22.
//

import Foundation

protocol IPostsViewController: IBaseViewController {
    func displayPosts(posts: [PostSimpleViewModel]?)
}

protocol IPostsPresenter: IBasePresenter {
    func fetchPosts()
}
