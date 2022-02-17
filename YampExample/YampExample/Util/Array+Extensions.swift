//
//  Array+Extensions.swift
//  BadgeOfHonor
//
//  Created by Kevin Damore on 10/11/18.
//  Copyright © 2018 Vectorform. All rights reserved.
//

import Foundation

extension Array {
    
    subscript (safe index: Int) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
    
    
}
