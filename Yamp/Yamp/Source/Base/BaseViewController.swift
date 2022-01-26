//
//  BaseViewController.swift
//  FakR
//
//  Created by Joshua Parmenter on 5/5/18.
//  Copyright © 2018 Vectorform. All rights reserved.
//

import UIKit

open class BaseViewController: UIViewController, IBaseViewController {
    /**
     A add any subviews you need in your override of this UIViewController method
     */
    open override func loadView() {
        super.loadView()
        view.backgroundColor = UIColor.white
    }

    /**
     Overrides the viewDidLoad() method of UIViewController and calls the internal method
     'installConstraints' - at this point, the size of the view is known and layout can be applied.
     */
    open override func viewDidLoad() {
        super.viewDidLoad()
        installConstraints()
    }

    /**
     an empty implementation in this class, but should be used by subclasses to add constraints
     to subviews. See the protocol for more notes.
     */
    internal func installConstraints() {

    }

    internal func addSubviews(views: [UIView], parent: UIView? = nil) {
        let viewToAddTo: UIView = parent ?? self.view
        for subView: UIView in views {
            viewToAddTo.addSubview(subView)
        }
    }

    func displayAlert(title: String?, message: String?, actions: [UIAlertAction]) {
        let alertView: UIAlertController = UIAlertController(title: title,
                                                             message: message,
                                                             preferredStyle: .alert)
        for action: UIAlertAction in actions {
            alertView.addAction(action)
        }
        present(alertView, animated: true, completion: nil)
    }

    func displayDefaultAlertForError(error: Error) {
        let okAction: UIAlertAction = UIAlertAction(title: "OK".localized(),
                                                    style: .default) {(_)
                                                        in {[weak self] in
                                                            self?.dismiss(animated: true, completion: nil)
                                                            }()
        }
        displayAlert(title: "Error".localized(), message: error.localizedDescription, actions: [okAction])
    }
}
