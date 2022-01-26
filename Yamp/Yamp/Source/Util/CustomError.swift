//
//  CustomError.swift
//  Adrian Steel
//
//  Created by Joshua Parmenter on 11/29/17.
//  Copyright © 2017 Vectorform LLC. All rights reserved.
//

import Foundation

//
// MARK: Custom Error Convertible protocol
//

public protocol CustomErrorConvertible {
    var error: NSError { get }
    var domain: String { get }
    var rawValue: Int { get }

    func errorWithDict( _ userDict: [AnyHashable: Any] ) -> NSError
}

let customErrorConvertibleBoxedKey = "CustomErrorConvertibleBoxedKey"

//
// MARK: Default Implementation
//

extension CustomErrorConvertible where Self: CustomStringConvertible {
    public var domain: String {
        return Bundle.main.bundleIdentifier!
    }

    public var error: NSError {
        return errorWithDict( [:] )
    }

    public func errorWithDict( _ userDict: [AnyHashable: Any] ) -> NSError {
        var dict = userDict

        if dict[NSLocalizedDescriptionKey] == nil {
            dict[NSLocalizedDescriptionKey] = description
        }

        if dict[customErrorConvertibleBoxedKey] == nil {
            dict[customErrorConvertibleBoxedKey] = Box(self)
        }

        return NSError(domain: domain, code: rawValue, userInfo: dict as? [String: Any])
    }
}

//
// MARK: NSError extension
//
extension NSError {
    public convenience init(domain: String, code: Int, description: String ) {
        // NSLocalizedDescriptionKey -
        // NSLocalizedFailureReasonErrorKey -
        // NSLocalizedRecoverySuggestionErrorKey -
        let infoDict: [AnyHashable: Any] = [NSLocalizedDescriptionKey: description]
        self.init(domain: domain, code: code, userInfo: infoDict as? [String: Any])
    }
    public func customErrorConvertible<CustomErrorType>() -> CustomErrorType? {
        if let box = self.userInfo[customErrorConvertibleBoxedKey] as? Box<CustomErrorType> {
            return box.unbox
        }
        return nil
    }
}

// This utility allows an object to be boxed and unboxed.  This is very useful for objects such as enums where you
// need to save them to a collection that only takes objects such as AnyObject.
//
open class Box<BoxedType> {
    var boxedValue: BoxedType
    public init(_ value: BoxedType) {
        boxedValue = value
    }
    open var unbox: BoxedType {
        return self.boxedValue
    }
}
