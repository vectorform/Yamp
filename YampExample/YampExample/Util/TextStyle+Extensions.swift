//
//  TextStyle+Extensions.swift
//  BadgeOfHonor
//
//  Created by Cory Bechtel on 12/18/19.
//  Copyright © 2019 Vectorform. All rights reserved.
//

import Foundation
import UIKit
import Texty

public extension TextStyle {
    convenience init(font: UIFont, color: UIColor) {
        self.init(attributes: [TextAttribute.font: font, TextAttribute.foregroundColor: color])
    }

    convenience init(font: UIFont) {
        self.init(attributes: [TextAttribute.font: font])
    }
    
    func setLineSpacing(_ spacing: CGFloat) {
        let style = self.paragraphStyle as? NSMutableParagraphStyle ?? NSMutableParagraphStyle()
        style.lineSpacing = spacing
        paragraphStyle = style
    }
}
