//
//  IBaseViewController.swift
//  FakR
//
//  Created by Joshua Parmenter on 5/5/18.
//  Copyright © 2018 Vectorform. All rights reserved.
//

import UIKit

/**
 IBaseViewControleller describes the interface that all ViewController subclasses will implement.
 The protocol implementation provides an initial point for installing constraints in code, and a shorthand
 method for adding multiple subviews to a parent.
 */

public protocol IMvpViewController where Self: UIViewController {
    /**
     In the implementation, this should add constriants to the main view's subviews. The base
     implementation should call this in viewDidLoad() or after the main view has been loaded.
     */

    func installConstraints()

    /**
     A conveneince method for adding  subviews to an optional parent view
     - parameter views: [UIView] - an array of UIView instance, in depth order, to add to the parent. The
     first view will be lowest in the view hierarchy.
     - parameter parent: UIView? an optional parent to add views to. If nil, the ViewController 'view'
     property will be used
     */

    func addSubviews(views: [UIView], parent: UIView?)

    /**
     A generic method for displaying a basic alert dialog

     - parameter title: String? - an optional string to be displayed at the top of the alert
     - parameter message: String? - an optional string with more detailed informatiopn
     - parameter actions: [UIAlertAction] - an array of actions that will be displayed as buttons
     */

    func displayAlert(title: String?, message: String?, actions: [UIAlertAction])

    /**
     A generic method for displaying a basic alert dialog for an Error, with an OK default

     - parameter error: Error - an instance of an Error that contains localized information to
     display as a message
     */
    func displayDefaultAlertForError(error: Error)
}
