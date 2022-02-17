//
//  DataManager.swift
//  VFMVPBase
//
//  Created by Joshua Parmenter on 5/5/18.
//  Copyright © 2018 Vectorform. All rights reserved.
//

import Foundation
import CoreData

open class DataManager: IDataManager {
    public let networkManager: INetworkManager

    public init(networkManager: INetworkManager) {
        self.networkManager = networkManager
    }

    public func shutdown() {
        networkManager.shutdown()
    }
}
