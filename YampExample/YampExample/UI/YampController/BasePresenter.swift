//
//  BasePresenter.swift
//  YampExample
//
//  Created by Cory Bechtel on 2/2/22.
//

import Foundation
import Yamp

class BasePresenter: MvpPresenter, IBasePresenter {

    private weak var myView: BaseViewController? {
        return self.view as? BaseViewController
    }

    var router: IRouter? {
        return myView?.navigationController as? IRouter
    }
}
