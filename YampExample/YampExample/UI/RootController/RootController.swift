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
        let home = HomeViewController()
        pushViewController(home, animated: false)
        view.backgroundColor = .red

    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
