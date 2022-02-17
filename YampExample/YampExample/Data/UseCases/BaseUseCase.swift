//
//  BaseUseCase.swift
//  YampExample
//
//  Created by Cory Bechtel on 2/3/22.
//

import Foundation
import Yamp

class BaseUseCase {
    let dataManager: IYampDataManager = MVPApp.instance.dependencyContainer.dataManager
//    let networkManager: IYampNetworkManager? = MVPApp.instance.dependencyContainer.dataManager.yampNetworkManager
//    let cacheManager: ICacheManager = MVPApp.instance.dependencyContainer.dataManager.cache
}
