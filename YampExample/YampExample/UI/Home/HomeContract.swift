//
//  HomeContract.swift
//  YampExample
//
//  Created by Cory Bechtel on 1/31/22.
//

import Foundation
import Yamp

protocol IHomeViewController: IBaseViewController {

}

protocol IHomePresenter: IBasePresenter {
    func navigateToPosts()
    func presentCollectionTest()
}
