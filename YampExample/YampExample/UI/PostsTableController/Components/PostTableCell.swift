//
//  PostTableCell.swift
//  YampExample
//
//  Created by Cory Bechtel on 2/3/22.
//

import Foundation
import UIKit
import Texty

class PostTableCell: UITableViewCell {

    static let reuseID: String = "postTableCell"
    private let titleLabel: TextyLabel = TextyLabel(textStyle: TextStyle(font: UIFont.systemFont(ofSize: 16)), textColor: .black)

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        backgroundColor = .clear

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    func set(post: PostSimpleViewModel) {
        titleLabel.text = post.title
    }
}
