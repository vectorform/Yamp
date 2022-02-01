//
//  IBaseNavigationController.swift

//  FakR
//
//  Created by Joshua Parmenter on 5/5/18.
//  Copyright © 2018 Vectorform. All rights reserved.
//

import UIKit

public protocol IMvpNavigationController {
    var presenter: IMvpNavigationPresenter { get }
}
