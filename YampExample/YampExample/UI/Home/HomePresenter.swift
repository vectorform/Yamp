//
//  HomePresenter.swift
//  YampExample
//
//  Created by Cory Bechtel on 1/31/22.
//

import Foundation
import Yamp

class HomePresenter: BasePresenter, IHomePresenter {

    private weak var myView: HomeViewController? {
        return self.view as? HomeViewController
    }

    func navigateToPosts() {
        router?.pushNetworkPostTest()
    }

    func presentCollectionTest() {
        router?.presentCollectionTest()
    }

    func makePostCall() {
        if let url: URL = URL(string: "jeepBOH:") {
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url) { (result) in
                    if result {
                       // The URL was delivered successfully!
                    }
                }
            }
        }
    }
}
