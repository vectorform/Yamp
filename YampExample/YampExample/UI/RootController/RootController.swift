//
//  RootController.swift
//  YampExample
//
//  Created by Cory Bechtel on 1/31/22.
//

import Foundation
import Yamp

class RootController: MvpNavigationController, IRouter {

    required init() {
        super.init()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let home = HomeViewController()
        pushViewController(home, animated: false)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func pushNetworkPostTest() {
        let postController = PostsViewController()
        pushViewController(postController, animated: true)
    }

    func presentCollectionTest() {
        let controller = PostsCollectionViewController()
        present(controller, animated: true, completion: nil)
    }
}
