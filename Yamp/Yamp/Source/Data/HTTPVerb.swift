//
//  HTTPVerb.swift
//  Yamp
//
//  Created by Cory Bechtel on 1/26/22.
//

import Foundation

public enum HTTPVerb {

    case get
    case post
    case delete
    case put
    case patch
    case custom(customVerb: String)

    var verbString: String {
        switch self {
        case .get:      return "GET"
        case .post:     return "POST"
        case .delete:   return "DELETE"
        case .put:      return "PUT"
        case .patch:    return "PATCH"
        case .custom(let customVerb): return customVerb
        }
    }
}
