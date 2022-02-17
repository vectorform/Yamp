//
//  BaseViewController.swift
//  YampExample
//
//  Created by Cory Bechtel on 2/2/22.
//

import UIKit
import Yamp

class BaseViewController: MvpViewController, IBaseViewController {

	private let presenter: IBasePresenter = BasePresenter()

    required override init() {
		super.init()

	}

    //
    // MARK: Life Cycle Events
    //

	override func loadView() {
		super.loadView()

	}

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.connectToView(view: self)
    }

	override func installConstraints() {
		super.installConstraints()

	}

    //
    // MARK: UI Interactions (targets for buttons etc)
    //

    //
    // MARK: Presenter protocol
    //

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
