//
//  DataManager.swift
//  VFMVPBase
//
//  Created by Joshua Parmenter on 5/5/18.
//  Copyright © 2018 Vectorform. All rights reserved.
//

import Foundation
import CoreData

class DataManager: IDataManager {
    private let networkManager: INetworkManager

    init(networkManager: INetworkManager) {
        self.networkManager = networkManager
    }

    func shutdown() {
        networkManager.shutdown()
    }
}
