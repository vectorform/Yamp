//
//  BaseNavigationController.swift
//  FakR
//
//  Created by Joshua Parmenter on 5/5/18.
//  Copyright © 2018 Vectorform. All rights reserved.
//

import UIKit

/**
 A subclass of UINavigationController that implements a ViewControllerFactory and Router protocol
 */

open class MvpNavigationController: UINavigationController, IMvpNavigationController {

    public lazy var presenter: IMvpNavigationPresenter = {
        MvpNavigationPresenter()
    }()

    required public init() {
        super.init(nibName: nil, bundle: nil)
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    open override func loadView() {
        super.loadView()
    }

    open override func viewDidLoad() {
        super.viewDidLoad()
        installConstriants()
    }

    open func installConstriants() {

    }
}
