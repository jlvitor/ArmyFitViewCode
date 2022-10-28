//
//  UserDetailCell.swift
//  ArmyFitViewCode
//
//  Created by Jean Lucas Vitor on 27/10/22.
//

import UIKit

class UserDetailCell: UITableViewCell {

    private lazy var userImageView: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(systemName: "person.fill")
        img.contentMode = .scaleAspectFill
        img.clipsToBounds = true
        img.layer.cornerRadius = 25
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()

    private lazy var userNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Nome do usuário"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(
            top: 0,
            left: 0,
            bottom: 5,
            right: 0))
        
        contentView.bounds = CGRectMake(
            contentView.bounds.origin.x,
            contentView.bounds.origin.y,
            contentView.bounds.size.width - 24,
            contentView.bounds.size.height)
        
        contentView.backgroundColor = UIColor(named: "dark")
        contentView.clipsToBounds = true
        contentView.layer.cornerRadius = 8
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension UserDetailCell: ViewCode {
    func buildHierarchy() {
        contentView.addSubview(userImageView)
        contentView.addSubview(userNameLabel)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            userImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            userImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            userImageView.widthAnchor.constraint(equalToConstant: 50),
            userImageView.heightAnchor.constraint(equalToConstant: 50),
            
            userNameLabel.leadingAnchor.constraint(equalTo: userImageView.trailingAnchor, constant: 20),
            userNameLabel.centerYAnchor.constraint(equalTo: userImageView.centerYAnchor)
        ])
    }
}
