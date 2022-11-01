//
//  FeedScreen.swift
//  ArmyFitViewCode
//
//  Created by Jean Lucas Vitor on 31/10/22.
//

import UIKit
import Kingfisher

class FeedScreen: UIView {
    
    private lazy var userPostView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "dark")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var userImageView: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(systemName: "person.circle")
        img.contentMode = .scaleToFill
        img.clipsToBounds = true
        img.layer.cornerRadius = 25
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    private lazy var postLabel: UILabel = {
        let label = UILabel()
        label.text = "No que você está pensando?"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 14, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var sendImageView: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(systemName: "paperplane.fill")
        img.tintColor = UIColor(named: "light")
        img.contentMode = .scaleAspectFit
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    lazy var postCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout.init())
        collectionView.backgroundColor = .clear
        collectionView.showsVerticalScrollIndicator = false
        collectionView.registerCell(type: PostCell.self)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        let layout: UICollectionViewFlowLayout = .init()
        layout.scrollDirection = .vertical
        collectionView.setCollectionViewLayout(layout, animated: true)
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configAllDelegate(_ delegate: UICollectionViewDelegate, _ dataSource: UICollectionViewDataSource) {
        postCollectionView.delegate = delegate
        postCollectionView.dataSource = dataSource
    }
    
    func configUserImage(_ viewModel: FeedViewModel) {
        userImageView.kf.setImage(with: URL(string: viewModel.getUserImage))
    }
}

extension FeedScreen: ViewCode {
    func buildHierarchy() {
        self.addSubview(userPostView)
        self.userPostView.addSubview(userImageView)
        self.userPostView.addSubview(postLabel)
        self.userPostView.addSubview(sendImageView)
        self.addSubview(postCollectionView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            userPostView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            userPostView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            userPostView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            userImageView.topAnchor.constraint(equalTo: userPostView.topAnchor, constant: 8),
            userImageView.leadingAnchor.constraint(equalTo: userPostView.leadingAnchor, constant: 12),
            userImageView.bottomAnchor.constraint(equalTo: userPostView.bottomAnchor, constant: -8),
            userImageView.heightAnchor.constraint(equalToConstant: 50),
            userImageView.widthAnchor.constraint(equalToConstant: 50),
            
            postLabel.leadingAnchor.constraint(equalTo: userImageView.trailingAnchor, constant: 12),
            postLabel.centerYAnchor.constraint(equalTo: userPostView.centerYAnchor),
            
            sendImageView.trailingAnchor.constraint(equalTo: userPostView.trailingAnchor, constant: -12),
            sendImageView.centerYAnchor.constraint(equalTo: userPostView.centerYAnchor),
            sendImageView.heightAnchor.constraint(equalToConstant: 20),
            sendImageView.widthAnchor.constraint(equalToConstant: 20),
            
            postCollectionView.topAnchor.constraint(equalTo: userPostView.bottomAnchor),
            postCollectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            postCollectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            postCollectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}
