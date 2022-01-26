//
//  UseCase.swift
//  VFMVPBase
//
//  Created by Josh Parmenter on 8/8/20.
//  Copyright © 2020 Vectorform. All rights reserved.
//

import UIKit

typealias UseCaseCompletion<ResultType> = (Result<ResultType, Error>) -> Void
typealias NoParameter = ()

protocol UseCase {
    associatedtype Parameter
    associatedtype ResultType

    func invoke(parameter: Parameter, completion: @escaping UseCaseCompletion<ResultType>)
}
