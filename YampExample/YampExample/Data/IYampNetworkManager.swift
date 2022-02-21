//
//  IYampNetworkManager.swift
//  YampExample
//
//  Created by Cory Bechtel on 2/2/22.
//

import Foundation
import Yamp

protocol IYampNetworkManager: INetworkManager{

    func getPosts(completion: @escaping GetPostsCompletion)
}
