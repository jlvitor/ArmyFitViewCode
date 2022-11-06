//
//  FeedViewController.swift
//  ArmyFitViewCode
//
//  Created by Jean Lucas Vitor on 28/09/22.
//

import UIKit

class FeedViewController: UIViewController {
    
    //MARK: - Private properties
    private var feedScreen: FeedScreen?
    private let viewModel: FeedViewModel = .init()
    
    //MARK: - Init`s
    override func loadView() {
        super.loadView()
        self.feedScreen = FeedScreen()
        self.feedScreen?.configAllDelegate(
            delegate: self,
            dataSource: self,
            newPostDelegate: self)
        self.feedScreen?.configUserImage(viewModel)
        self.view = self.feedScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackground()
        setupNavigationBar()
        configViewModel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.getPosts()
    }
    
    //MARK: - Private methods
    private func setupBackground() {
        self.view.backgroundColor = UIColor(named: "light")
    }
    
    private func setupNavigationBar() {
        navigationItem.title = "Feed"
    }
    
    private func configViewModel() {
        viewModel.delegate = self
        viewModel.likeDelegate = self
        viewModel.getPosts()
    }
}

// MARK: - UICollectionViewDelegate, UICollectionViewDelegateFlowLayout
extension FeedViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(
            width: view.bounds.width - 24,
            height: 160)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 15, left: 0, bottom: 15, right: 0)
    }
}

// MARK: - UICollectionViewDataSource
extension FeedViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.getNumberOfPosts
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let postCell = collectionView.dequeueCell(withType: PostCell.self, for: indexPath) as? PostCell else {
            return UICollectionViewCell()
        }
        
        let cellViewModel = viewModel.getPostCellViewModel(indexPath.row)
        postCell.configure(cellViewModel)
        
        postCell.clipsToBounds = true
        postCell.layer.cornerRadius = 8
        postCell.backgroundColor = UIColor(named: "dark")
        
        return postCell
    }
}

// MARK: - LikeAPostDelegate
extension FeedViewController: LikeAPostDelegate {
    func likeSuccess() {
        viewModel.getPosts()
    }
}

// MARK: - PostViewModelDelegate
extension FeedViewController: PostViewModelDelegate {
    func reloadData() {
        feedScreen?.postCollectionView.reloadData()
    }
}

// MARK: - ButtonPressedDelegate
extension FeedViewController: ButtonPressedDelegate {
    func likeButton(sender: Int) {
        viewModel.likeAPost(index: sender)
    }
    
    func commentButton() {
        print("comentario")
    }
}

// MARK: - FeedScreenProtocol
extension FeedViewController: FeedScreenProtocol {
    func newPost() {
        let vc: PostViewController = .init()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
