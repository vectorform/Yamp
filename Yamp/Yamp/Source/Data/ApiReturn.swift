//
//  ApiReturn.swift
//  Yamp
//
//  Created by Cory Bechtel on 2/17/22.
//

import Foundation

public class ApiReturn {

    public var error: Error?
    public var response: HTTPURLResponse?
    public var data: Data?

    public var hasError: Bool {
        return error != nil
    }

    public init(error: Error?, response: HTTPURLResponse? = nil, data: Data? = nil) {
        self.error = error
        self.response = response
        self.data = data
    }
}
