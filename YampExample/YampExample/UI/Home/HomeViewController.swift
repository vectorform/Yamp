//
//  HomeViewController.swift
//  YampExample
//
//  Created by Cory Bechtel on 1/31/22.
//

import UIKit
import Yamp

class HomeViewController: MvpViewController, IHomeViewController {

	private let presenter: IHomePresenter = HomePresenter()

	override required init() {
        super.init()

	}

    //
    // MARK: Life Cycle Events
    //

	override func loadView() {
		super.loadView()

        title = "Home"
        view.backgroundColor = .white
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
