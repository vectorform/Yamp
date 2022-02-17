//
//  FetchPostsUseCase.swift
//  YampExample
//
//  Created by Cory Bechtel on 2/3/22.
//

import Foundation
import Yamp

class FetchPostsUseCase: BaseUseCase, IFetchUseCase {
    typealias ResultType = [PostViewModel]

    func invoke(completion: @escaping UseCaseCompletion<[PostViewModel]>) {
        dataManager.fetchPosts { posts, error in
            if let posts = posts {
                completion(.success(posts.asViewModel()))
            }
            else {
                completion(.failure(error ?? NSError(domain: "", code: 0, description: "no valid post data")))
            }
        }
    }
}
