//
//  HomeViewController.swift
//  YampExample
//
//  Created by Cory Bechtel on 1/31/22.
//

import UIKit
import Yamp

class HomeViewController: BaseViewController, IHomeViewController {

	private let presenter: IHomePresenter = HomePresenter()
    private let pushButton: CTAButton = CTAButton(style: .primary, image: nil)
    private let presentButton: CTAButton = CTAButton(style: .secondary, image: nil)
    private let disabledButton: CTAButton = CTAButton(style: .primary, image: nil)
    private let networkTest: CTAButton = CTAButton(style: .primary, image: nil)

    required init() {
        super.init()

	}

    //
    // MARK: Life Cycle Events
    //

	override func loadView() {
		super.loadView()

        title = "Home"
        view.backgroundColor = .black

        addSubviews(views: [pushButton, presentButton, disabledButton, networkTest])

        for button in [pushButton, presentButton, disabledButton, networkTest] {
            button.addTarget(self, action: #selector(pressedButton(sender:)), for: .touchUpInside)
        }

        pushButton.setTitle("Push")
        presentButton.setTitle("Present")
        disabledButton.setTitle("Disabled")
        networkTest.setTitle("Network Test")
        disabledButton.isEnabled = false

	}

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.connectToView(view: self)
    }

	override func installConstraints() {
		super.installConstraints()

        pushButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.height.equalTo(48)
            make.left.right.equalToSuperview().inset(20)
        }

        presentButton.snp.makeConstraints { make in
            make.top.equalTo(pushButton.snp.bottom).offset(20)
            make.height.equalTo(48)
            make.left.right.equalToSuperview().inset(20)
        }

        disabledButton.snp.makeConstraints { make in
            make.top.equalTo(presentButton.snp.bottom).offset(20)
            make.height.equalTo(48)
            make.left.right.equalToSuperview().inset(20)
        }

        networkTest.snp.makeConstraints { make in
            make.top.equalTo(disabledButton.snp.bottom).offset(20)
            make.height.equalTo(48)
            make.left.right.equalToSuperview().inset(20)
        }
	}

    //
    // MARK: UI Interactions (targets for buttons etc)
    //

    @objc func pressedButton(sender: UIButton) {
        switch sender {
        case pushButton:
            presenter.navigateToPosts()
        case presentButton:
            presenter.presentCollectionTest()
        case disabledButton:
            break
        case networkTest:
            break
        default:
            break
        }
    }


    //
    // MARK: Presenter protocol
    //

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
