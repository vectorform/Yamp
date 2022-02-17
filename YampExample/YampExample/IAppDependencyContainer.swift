//
//  IAppDependencyContainer.swift
//  VFMVPBase
//
//  Created by Josh Parmenter on 8/8/20.
//  Copyright © 2020 Vectorform. All rights reserved.
//

import UIKit
import Yamp

protocol IAppDependencyContainer {
    var dataManager: IYampDataManager { get }

    func shutdown()
}
