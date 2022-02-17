//
//  UseCase.swift
//  VFMVPBase
//
//  Created by Josh Parmenter on 8/8/20.
//  Copyright © 2020 Vectorform. All rights reserved.
//

import UIKit

public typealias UseCaseCompletion<ResultType> = (Result<ResultType, Error>) -> Void
public typealias NoParameter = ()

public protocol IUseCase {
    associatedtype Parameter
    associatedtype ResultType

    func invoke(parameter: Parameter, completion: @escaping UseCaseCompletion<ResultType>)
}

public protocol IFetchUseCase {
    associatedtype ResultType

    func invoke(completion: @escaping UseCaseCompletion<ResultType>)
}
