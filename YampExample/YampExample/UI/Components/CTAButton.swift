//
//  CTAButton.swift
//  BadgeOfHonor
//
//  Created by Cory Bechtel on 1/12/22.
//  Copyright © 2022 Vectorform. All rights reserved.
//

import Foundation
import UIKit
import Texty
import SnapKit

//puts icon and label correctly into the button
class CTAButton: UIControl {

    private let containerView: UIView = UIView()
    private let label: TextyLabel
    public let imageView: UIImageView = UIImageView()
    private let style: ButtonStyle
    private var usingCustomImageTint: Bool = false

    private var customImageTintColors: [UIColor] = []

    override var isHighlighted: Bool {
        didSet {
            if isHighlighted {
                setHighlightedState()
            }
            else {
                setNormalState()
            }
        }
    }

    override var isEnabled: Bool {
        didSet {
            if isEnabled {
                setNormalState()
            }
            else {
                setDisabledState()
            }
        }
    }

    func setNormalState() {
        label.textColor = style.titleColor
        if !usingCustomImageTint {
            imageView.tintColor = style.titleColor
        }
        else {
            imageView.tintColor = customImageTintColors[safe: 0] ?? style.titleColor
        }
        backgroundColor = style.backgroundColor
    }

    func setHighlightedState() {
        label.textColor = style.pressedTitleColor
        if !usingCustomImageTint {
            imageView.tintColor = style.pressedTitleColor
        }
        else {
            imageView.tintColor = customImageTintColors[safe: 1] ?? style.titleColor
        }
        backgroundColor = style.pressedBackgroundColor
    }

    func setDisabledState() {
        label.textColor = style.disabledTitleColor
        if !usingCustomImageTint {
            imageView.tintColor = style.disabledTitleColor
        }
        else {
            imageView.tintColor = customImageTintColors[safe: 2] ?? style.titleColor
        }
        backgroundColor = style.disabledBackgroundColor
    }

    init(style: ButtonStyle, image: UIImage?) {
        self.label = TextyLabel(textStyle: style.textStyle, textColor: style.titleColor)
        self.style = style
        super.init(frame: .zero)

        addSubview(containerView)
        containerView.addSubview(label)
        containerView.addSubview(imageView)

        setNormalState()
        layer.cornerRadius = 2

        containerView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.left.greaterThanOrEqualToSuperview()
            make.right.lessThanOrEqualToSuperview()
        }

        label.snp.makeConstraints { make in
            make.left.centerY.equalToSuperview()
        }

        if let image = image {

            if image.size.height > 16 || image.size.width > 16 {
                imageView.contentMode = .scaleAspectFit
            }
            else {
                imageView.contentMode = .center
            }

            imageView.image = image.withRenderingMode(.alwaysTemplate)
            imageView.tintColor = style.titleColor
            imageView.snp.makeConstraints { make in
                make.right.centerY.equalToSuperview()
                make.size.equalTo(16)
                make.left.equalTo(label.snp.right).offset(8)
            }
        }
        else {
            imageView.snp.makeConstraints { make in
                make.right.centerY.equalToSuperview()
                make.size.equalTo(0)
                make.left.equalTo(label.snp.right)
            }
        }
    }

    func setTitle(_ title: String) {
        label.text = title
    }

    func setCornerRadius(radius: CGFloat) {
        layer.cornerRadius = radius
    }

    func setCustomImageTint(normal: UIColor, pressedTint: UIColor, disabledTint: UIColor) {
        usingCustomImageTint = true
        imageView.tintColor = normal
        customImageTintColors = [normal, pressedTint, disabledTint]
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
