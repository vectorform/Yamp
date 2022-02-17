//
//  String+Extensions.swift
//  VFMVPBase
//
//  Created by Joshua Parmenter on 5/5/18.
//  Copyright © 2018 Vectorform. All rights reserved.
//

import Foundation

extension String {
    public func localized() -> String {
        return NSLocalizedString(self, comment: "")
    }

    public func localized(comment: String = "") -> String {
        return NSLocalizedString(self, comment: comment)
    }

    public func localized(formatArgs: CVarArg...) -> String {
        return withVaList(formatArgs) {
            NSString(format: NSLocalizedString(self, comment: ""), arguments: $0)
            } as String
    }

    public func localizedFromTable(table: String) -> String {
        return Bundle.main.localizedString(forKey: self, value: nil, table: table)
    }
}
