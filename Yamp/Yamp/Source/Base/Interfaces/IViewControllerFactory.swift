//
//  IViewControllerFactory.swift
//  FakR
//
//  Created by Joshua Parmenter on 5/5/18.
//  Copyright © 2018 Vectorform. All rights reserved.
//

import UIKit

/**
 The protocol that creates the primary views of the application. Presetner and View(Controller)
 classes must be created and returned.
 */

protocol IViewControllerFactory {
    /**
     Creates the first view for our application

     - Returns: a class that implements the IHomeViewController protocol
     */
    func createHomeView() -> IHomeViewController
    /**
     Creates the user listing view for our application

     - Returns: a class that implements the IUserViewController protocol
     */
    func createUserView() -> IUserViewController
}
