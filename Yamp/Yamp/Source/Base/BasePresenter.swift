//
//  BasePresenter.swift
//  VFMVPBase
//
//  Created by Joshua Parmenter on 5/5/18.
//  Copyright © 2018 Vectorform. All rights reserved.
//

import UIKit

open class BasePresenter: IBasePresenter {
    internal weak var view: UIViewController?

    func connectToView(view: UIViewController) {
        self.view = view
    }
}
