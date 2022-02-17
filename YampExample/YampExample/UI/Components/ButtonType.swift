//
//  ButtonStyle.swift
//  Taubman
//
//  Created by Kevin Damore on 5/21/18.
//  Copyright © 2018 Vectorform. All rights reserved.
//

import Texty

enum ButtonStyle {

	case primary
	case secondary

	var backgroundColor: UIColor {

		switch self {
        case .primary:                  return .yellow
        case .secondary:                return .cyan
		}
	}

	var pressedBackgroundColor: UIColor {
        return backgroundColor.withAlphaComponent(0.7)
	}

	var disabledBackgroundColor: UIColor {
        return backgroundColor.withAlphaComponent(0.3)
	}

	var titleColor: UIColor {
		switch self {
        case .primary:                  return .black
		case .secondary:                return .black
		}
	}

	var pressedTitleColor: UIColor {
        return titleColor.withAlphaComponent(0.8)
	}

	var disabledTitleColor: UIColor {
        return titleColor.withAlphaComponent(0.3)
	}

	var borderColor: UIColor {
        return .clear
	}

	var borderWidth: CGFloat {
        return 0
	}

	var pressedBorderColor: UIColor {
        return .clear
	}

	var horizontalAlignment: UIControl.ContentHorizontalAlignment {
        return .center
	}

	var textStyle: TextStyle {
        return TextStyle(font: UIFont.systemFont(ofSize: 16))
	}
}
