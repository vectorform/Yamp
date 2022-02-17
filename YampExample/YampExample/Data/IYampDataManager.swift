//
//  IYampDataManager.swift
//  YampExample
//
//  Created by Cory Bechtel on 2/2/22.
//

import Foundation
import Yamp

protocol IYampDataManager: IDataManager {

    var yampNetworkManager: IYampNetworkManager? { get }
    var cache: ICacheManager { get }

    func fetchPosts(completion: @escaping GetPostsCompletion)
}
