//
//  PostsViewController.swift
//  YampExample
//
//  Created by Cory Bechtel on 2/3/22.
//

import UIKit
import Yamp

class PostsViewController: BaseViewController, IPostsViewController {

	private let presenter: IPostsPresenter = PostsPresenter()
    private let postTableView: UITableView = UITableView(frame: .zero, style: .plain)
    private lazy var postTableAdapter: PostTableAdapter = PostTableAdapter(tableView: postTableView)

	required init() {
		super.init()

	}

    //
    // MARK: Life Cycle Events
    //

	override func loadView() {
		super.loadView()

        addSubviews(views: [postTableView])
        title = "Posts".localized()
	}

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.connectToView(view: self)
        presenter.fetchPosts()
        postTableView.backgroundColor = .white
        postTableView.rowHeight = 50

    }

	override func installConstraints() {
		super.installConstraints()

        postTableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
	}

    //
    // MARK: UI Interactions (targets for buttons etc)
    //

    //
    // MARK: Presenter protocol
    //

    func displayPosts(posts: [PostSimpleViewModel]?) {
        postTableAdapter.updateData(data: posts ?? [])
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
