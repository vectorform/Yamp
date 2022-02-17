//
//  AppDependencyContainer.swift
//  VFMVPBase
//
//  Created by Josh Parmenter on 8/8/20.
//  Copyright © 2020 Vectorform. All rights reserved.
//

import UIKit
import Yamp

class AppDependencyContainer: IAppDependencyContainer {

    let dataManager: IYampDataManager

    init() {
        let networkManager: INetworkManager = YampNetworkManager(baseURL: "https://jsonplaceholder.typicode.com/")
        self.dataManager = YampDataManager(networkManager: networkManager)
    }

    func shutdown() {
        dataManager.shutdown()
    }

}
