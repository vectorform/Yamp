//
//  PostCollectionCell.swift
//  YampExample
//
//  Created by Cory Bechtel on 2/10/22.
//

import Foundation
import UIKit
import Texty

class PostCollectionCell: UICollectionViewCell {

    static let reuseID: String = "PostCollectionCell.reuseID"

    private let titleLabel: TextyLabel = TextyLabel(textStyle: TextStyle(font: UIFont.systemFont(ofSize: 18)), textColor: .black)
    private let postLabel: TextyLabel = TextyLabel(textStyle: TextStyle(font: UIFont.systemFont(ofSize: 12)), textColor: .black)
    private let idLabel: TextyLabel = TextyLabel(textStyle: TextStyle(font: UIFont.systemFont(ofSize: 12)), textColor: .black)
    private let userIDLabel: TextyLabel = TextyLabel(textStyle: TextStyle(font: UIFont.systemFont(ofSize: 12)), textColor: .black)

    override init(frame: CGRect) {
        super.init(frame: .zero)

        configureSubviews()
        installConstraints()

        layoutSubviews()
        updateConstraints()
        contentView.backgroundColor = .white
        contentView.layer.borderColor = UIColor.black.cgColor
        contentView.layer.borderWidth = 2
    }

    func configureSubviews() {
        for view in [titleLabel, postLabel, idLabel, userIDLabel] {
            contentView.addSubview(view)
        }
    }

    func installConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.left.top.right.equalToSuperview()
            make.height.equalTo(20)
        }

        postLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom)
            make.left.right.equalToSuperview().inset(1)
            make.height.equalTo(20)
        }

        idLabel.snp.makeConstraints { make in
            make.top.equalTo(postLabel.snp.bottom)
            make.left.right.equalToSuperview().inset(1)
            make.height.equalTo(20)
        }

        userIDLabel.snp.makeConstraints { make in
            make.top.equalTo(idLabel.snp.bottom)
            make.left.right.equalToSuperview().inset(1)
            make.height.equalTo(20)
        }
    }

    func setPost(post: PostViewModel) {
        titleLabel.text = post.title
        postLabel.text = post.body
        idLabel.text = "# \(post.id)"
        userIDLabel.text = "UID: \(post.userID)"
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
