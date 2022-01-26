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

public class BaseNavigationController: UINavigationController, IBaseNavigationController {

    internal lazy var presenter: IBaseNavigationPresenter = {
        BaseNavigationPresenter()
    }()

    required init() {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public override func loadView() {
        super.loadView()
    }

    public override func viewDidLoad() {
        super.viewDidLoad()
        installConstriants()
    }

    open func installConstriants() {

    }
}
