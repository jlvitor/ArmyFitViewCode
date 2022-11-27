//
//  CommentsCell.swift
//  ArmyFitViewCode
//
//  Created by Jean Lucas Vitor on 07/11/22.
//

import UIKit
import Kingfisher

class CommentsCell: UITableViewCell {
    
    private lazy var userImageView: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(systemName: "person.circle")
        img.contentMode = .scaleAspectFill
        img.clipsToBounds = true
        img.layer.cornerRadius = 25
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    private lazy var commentStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [userNameLabel,commentLabel])
        stack.axis = .vertical
        stack.alignment = .top
        stack.distribution = .fill
        stack.spacing = 12
        stack.clipsToBounds = true
        stack.layer.cornerRadius = 8
        stack.backgroundColor = UIColor(named: "dark")
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var userNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Glória"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var commentLabel: UILabel = {
        let label = UILabel()
        label.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cursus in vel non at scelerisque enim tempor, ipsum. Facilisis porttitor mattis hendrerit lectus. Ullamcorper scelerisque nunc tempor vulputate nibh nunc. Pretium, risus massa a vitae in sapien ultrices."
        label.textColor = .white
        label.textAlignment = .justified
        label.font = UIFont.systemFont(ofSize: 15)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
        func configUserLabel(_ viewModel: CommentViewModel) {
            userImageView.kf.setImage(with: URL(string: viewModel.getUserImage))
            userNameLabel.text = viewModel.getUserName
            commentLabel.text = viewModel.getComment
        }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CommentsCell: ViewCode {
    func buildHierarchy() {
        self.addSubview(userImageView)
        self.addSubview(commentStackView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            userImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 12),
            userImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12),
            userImageView.heightAnchor.constraint(equalToConstant: 50),
            userImageView.widthAnchor.constraint(equalToConstant: 50),
            
            commentStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 12),
            commentStackView.leadingAnchor.constraint(equalTo: userImageView.trailingAnchor, constant: 8),
            commentStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -12),
            commentStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -12),
            
            userNameLabel.topAnchor.constraint(equalTo: commentStackView.topAnchor, constant: 8),
            userNameLabel.leadingAnchor.constraint(equalTo: commentStackView.leadingAnchor, constant: 8),
            
            commentLabel.leadingAnchor.constraint(equalTo: commentStackView.leadingAnchor, constant: 8),
            commentLabel.trailingAnchor.constraint(equalTo: commentStackView.trailingAnchor, constant: -8),
            commentLabel.bottomAnchor.constraint(equalTo: commentStackView.bottomAnchor, constant: -8)
        ])
    }
}
