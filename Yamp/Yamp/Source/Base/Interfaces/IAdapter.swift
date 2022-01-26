//
//  IAdapter.swift
//  VFMVPBase
//
//  Created by Josh Parmenter on 8/12/20.
//  Copyright © 2020 Vectorform. All rights reserved.
//

import UIKit

protocol IAdapter {
    associatedtype DataType
    var data: [DataType] { get }
    func updateData(data: [DataType])
}

protocol ITableViewAdapter: IAdapter, UITableViewDataSource {
    init(tableView: UITableView)
    var tableView: UITableView { get }
}

protocol ICollectionViewAdapter: IAdapter, UICollectionViewDataSource {
    init(collectionView: UICollectionView)
    var collectionView: UICollectionView { get }
}
