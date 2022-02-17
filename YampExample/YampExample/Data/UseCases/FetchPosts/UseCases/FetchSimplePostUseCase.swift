//
//  FetchSimplePostUseCase.swift
//  YampExample
//
//  Created by Cory Bechtel on 2/10/22.
//

import Foundation
import Yamp

class FetchSimplePostsUseCase: BaseUseCase, IFetchUseCase {
    typealias ResultType = [PostSimpleViewModel]

    func invoke(completion: @escaping UseCaseCompletion<[PostSimpleViewModel]>) {
        dataManager.fetchPosts { posts, error in
            if let posts = posts {
                completion(.success(posts.asSimpleViewModel()))
            }
            else {
                completion(.failure(error ?? NSError(domain: "", code: 0, description: "no valid post data")))
            }
        }
    }
}
