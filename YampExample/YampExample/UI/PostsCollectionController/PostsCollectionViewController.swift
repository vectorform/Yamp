//
//  PostsCollectionViewController.swift
//  YampExample
//
//  Created by Cory Bechtel on 2/10/22.
//

import UIKit
import Yamp

class PostsCollectionViewController: BaseViewController, IPostsCollectionViewController {

	private let presenter: IPostsCollectionPresenter = PostsCollectionPresenter()
    private let collectionView: UICollectionView
    private let collectionAdapter: PostCollectionAdapter

	required init() {

        let flow = UICollectionViewFlowLayout()
        flow.scrollDirection = .vertical
        flow.itemSize = CGSize(width: UIScreen.main.bounds.width / 2 - 20, height: 80)
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: flow)
        collectionAdapter = PostCollectionAdapter(collectionView: collectionView)
		super.init()
//        modalPresentationStyle = .fullScreen
	}

    //
    // MARK: Life Cycle Events
    //

	override func loadView() {
		super.loadView()
        addSubviews(views: [collectionView])

	}

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.connectToView(view: self)
        presenter.fetchPosts()
    }

	override func installConstraints() {
		super.installConstraints()


        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

	}

    //
    // MARK: UI Interactions (targets for buttons etc)
    //

    //
    // MARK: Presenter protocol
    //

    func displayPosts(posts: [PostViewModel]?) {
        collectionAdapter.updateData(data: posts ?? [])
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
