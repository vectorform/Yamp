//
//  HomePresenter.swift
//  YampExample
//
//  Created by Cory Bechtel on 1/31/22.
//

import Foundation
import Yamp

class HomePresenter: MvpPresenter, IHomePresenter {

    private weak var myView: HomeViewController? {
        return self.view as? HomeViewController
    }

    func navigateToSecondaryScreen() {

    }

    func pushSecondaryScreen() {
        
    }
}
