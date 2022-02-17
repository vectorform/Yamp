//
//  PostCollectionAdapter.swift
//  YampExample
//
//  Created by Cory Bechtel on 2/10/22.
//

import Foundation
import Yamp

class PostCollectionAdapter: NSObject, ICollectionViewAdapter, UICollectionViewDataSource {

    var collectionView: UICollectionView
    var data: [PostViewModel] = []

    typealias DataType = PostViewModel

    required init(collectionView: UICollectionView) {
        self.collectionView = collectionView
        collectionView.register(PostCollectionCell.self, forCellWithReuseIdentifier: PostCollectionCell.reuseID)
        super.init()
        collectionView.dataSource = self
    }

    func updateData(data: [PostViewModel]) {
        self.data = data
        collectionView.reloadData()
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PostCollectionCell.reuseID, for: indexPath) as? PostCollectionCell else {
            fatalError("Collection View Cell Error")
        }
        cell.setPost(post: data[indexPath.row])
        return cell
    }
}
