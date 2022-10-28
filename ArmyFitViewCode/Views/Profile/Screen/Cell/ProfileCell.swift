//
//  ProfileCell.swift
//  ArmyFitViewCode
//
//  Created by Jean Lucas Vitor on 29/09/22.
//

import UIKit

struct ProfileCellViewModel {
    let icon: UIImage?
    let label: String
}

final class ProfileCell: UITableViewCell {
    
    //MARK: - Private properties
    private lazy var cellView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "dark")
        view.clipsToBounds = true
        view.layer.cornerRadius = 8
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var cellImageView: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFit
        img.tintColor = .white
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    private lazy var cellLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //MARK: - Init`s
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
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Public method
    func configure(with model: ProfileCellViewModel) {
        cellImageView.image = model.icon
        cellLabel.text = model.label
    }
}

// MARK: - ViewCode
extension ProfileCell: ViewCode {
    func buildHierarchy() {
        contentView.addSubview(cellView)
        cellView.addSubview(cellImageView)
        cellView.addSubview(cellLabel)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            cellView.topAnchor.constraint(equalTo: contentView.topAnchor),
            cellView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            cellView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            cellView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            cellImageView.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 10),
            cellImageView.centerYAnchor.constraint(equalTo: cellView.centerYAnchor),
            cellImageView.heightAnchor.constraint(equalToConstant: 25),
            cellImageView.widthAnchor.constraint(equalToConstant: 25),
            
            cellLabel.leadingAnchor.constraint(equalTo: cellImageView.trailingAnchor, constant: 10),
            cellLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant:  -10),
            cellLabel.centerYAnchor.constraint(equalTo: cellView.centerYAnchor)
        ])
    }
}
