//
//  IDataManager.swift
//  VFMVPBase
//
//  Created by Joshua Parmenter on 5/5/18.
//  Copyright © 2018 Vectorform. All rights reserved.
//

import Foundation
import CoreData

public protocol IDataManager: AnyObject {
    
    /**
     Save the current state of the persistent store to disk, and cancels any data or download tasks
     in the network manager
     */
    func shutdown()
}

public typealias DataManagerNetworkCompletion = (_: Bool, _ : Error?) -> Void

public enum DataManagerError: Int, CustomStringConvertible, CustomErrorConvertible {
    case noConnectedNetworkManager = 1000, dataReturnedInAnUnexpectedFormat

    public var domain: String {
        return "DataManagerError"
    }

    public var description: String {
        switch self {
        case .noConnectedNetworkManager:
            return "A Network Manager is not connected to this instance of DataManager"
        case .dataReturnedInAnUnexpectedFormat:
            return "Data returned was not in the format expected"
        }
    }
}
