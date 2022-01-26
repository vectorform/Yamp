//
//  IRouter.swift
//  VFMVPBase
//
//  Created by Joshua Parmenter on 5/14/18.
//  Copyright © 2018 Vectorform. All rights reserved.
//

/**
 primary functionality is implemented with the UINavigationViewController class
 */

protocol IRouter {
    /**
     Navigate to the user view that lists users in the persistent store, and allows for additions
     and deletion
     */
    func navigateToUserView()
    /**
     Navigate to the post view that lists posts in the persistent store, and allows for querying
     from an API for more
     */
    func navigateToPostsView()
}
