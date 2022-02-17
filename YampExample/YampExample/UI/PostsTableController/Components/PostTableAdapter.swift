//
//  PostTableAdapter.swift
//  YampExample
//
//  Created by Cory Bechtel on 2/3/22.
//

import Foundation
import Yamp

class PostTableAdapter: NSObject, ITableViewAdapter {

    typealias DataType = PostSimpleViewModel

    var data: [PostSimpleViewModel] = []
    var tableView: UITableView

    func updateData(data: [PostSimpleViewModel]) {
        self.data = data
        tableView.reloadData()
    }

    required init(tableView: UITableView) {
        self.tableView = tableView
        super.init()
        self.tableView.dataSource = self
        self.tableView.register(PostTableCell.self, forCellReuseIdentifier: PostTableCell.reuseID)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PostTableCell.reuseID, for: indexPath)
        if let cell = cell as? PostTableCell {
            cell.set(post: data[indexPath.row])
        }
        return cell
    }
}
