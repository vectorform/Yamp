//
//  BaseViewController.swift
//  YampExample
//
//  Created by Cory Bechtel on 2/2/22.
//

import UIKit
import Yamp

// this is where you would put logic that will be shared amongst all controllers.  Generally not a lot goes in here, but things like showing a webview, alert, or other models might makes their way in here.  Models are also shown from the nav controller in many cases.
class BaseViewController: MvpViewController, IBaseViewController {

	private let presenter: IBasePresenter = BasePresenter()

    required override init() {
		super.init()

	}

    //
    // MARK: Life Cycle Events
    //

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.connectToView(view: self)
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
