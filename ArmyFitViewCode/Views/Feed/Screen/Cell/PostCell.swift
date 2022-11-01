//
//  PostCell.swift
//  ArmyFitViewCode
//
//  Created by Jean Lucas Vitor on 31/10/22.
//

import UIKit
import Kingfisher

class PostCell: UICollectionViewCell {
    
    private lazy var topStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [userImageView, detailStackView, shareButton])
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .fill
        stack.spacing = 10
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var userImageView: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(systemName: "person.circle")
        img.contentMode = .scaleAspectFill
        img.clipsToBounds = true
        img.layer.cornerRadius = 25
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    private lazy var detailStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [userNameLabel, dateLabel])
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var userNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Glória"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.text = "18 mai 2022 17:00"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 10)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var shareButton: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(systemName: "square.and.arrow.up"), for: .normal)
        btn.tintColor = .white
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    private lazy var postLabel: UILabel = {
        let label = UILabel()
        label.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cursus in vel non at scelerisque enim tempor, ipsum. Facilisis porttitor mattis hendrerit lectus. Ullamcorper scelerisque nunc tempor vulputate nibh nunc. Pretium, risus massa a vitae in sapien ultrices."
        label.textColor = .white
        label.textAlignment = .justified
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 3
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var bottomStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [likeStackView, commentStackView])
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .equalSpacing
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var likeStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [likeImageView, likeLabel])
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .fill
        stack.spacing = 8
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var likeImageView: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(systemName: "hand.thumbsup")
        img.tintColor = .white
        img.contentMode = .scaleAspectFill
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    private lazy var likeLabel: UILabel = {
        let label = UILabel()
        label.text = "Curtir"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var commentStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [commentImageView, commentLabel])
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .fill
        stack.spacing = 8
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var commentImageView: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(systemName: "bubble.left")
        img.tintColor = .white
        img.contentMode = .scaleAspectFill
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    private lazy var commentLabel: UILabel = {
        let label = UILabel()
        label.text = "Comentar"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(_ viewModel: PostViewModel) {
        userImageView.kf.setImage(with: URL(string: viewModel.getUserImage))
        userNameLabel.text = viewModel.getUserName
        postLabel.text = viewModel.getPostText
        likeLabel.text = viewModel.numberOfLikes()
        commentLabel.text = viewModel.numberOfComments()
    }
}

extension PostCell: ViewCode {
    func buildHierarchy() {
        contentView.addSubview(topStackView)
        contentView.addSubview(postLabel)
        contentView.addSubview(bottomStackView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            topStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            topStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            topStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            
            userImageView.heightAnchor.constraint(equalToConstant: 50),
            userImageView.widthAnchor.constraint(equalToConstant: 50),
            
            shareButton.widthAnchor.constraint(equalToConstant: 40),
            
            postLabel.topAnchor.constraint(equalTo: topStackView.bottomAnchor, constant: 12),
            postLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            postLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            
            bottomStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            bottomStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            bottomStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            
            likeImageView.widthAnchor.constraint(equalToConstant: 16),
            likeImageView.heightAnchor.constraint(equalToConstant: 16),
            
            commentImageView.widthAnchor.constraint(equalToConstant: 16),
            commentImageView.heightAnchor.constraint(equalToConstant: 16)

        ])
    }
}
