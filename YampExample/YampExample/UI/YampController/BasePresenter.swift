//
//  BasePresenter.swift
//  YampExample
//
//  Created by Cory Bechtel on 2/2/22.
//

import Foundation
import Yamp

//This is where things that are shared amounst all presenters is placed.  Logic like where you local router is, and buisness logic that could be shared by multiple screens.  
class BasePresenter: MvpPresenter, IBasePresenter {

    private weak var myView: BaseViewController? {
        return self.view as? BaseViewController
    }

    var router: IRouter? {
        return myView?.navigationController as? IRouter
    }
}
