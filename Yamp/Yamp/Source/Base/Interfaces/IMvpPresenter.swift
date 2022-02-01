//
//  IBasePresenter.swift

//  FakR
//
//  Created by Joshua Parmenter on 5/5/18.
//  Copyright © 2018 Vectorform. All rights reserved.
//

import Foundation
import UIKit

/**
 Defines the base class for any ViewController's accompanying Presenter class that helps manage data to
 be shown.
 */

public protocol IMvpPresenter: AnyObject {
    /// ---
    /// A weak reference to the view controller that is associated with this instance of an IBasePresenter

    var view: UIViewController? { get }

    /**
     A method to store a reference to an instance of the accompanying UIViewController that should get
     updates for data changes.

     - parameter view: UIViewController - the view to interact with when data changes are detected
     */
    func connectToView(view: UIViewController)
}
