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

    private lazy var cellImageView: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(systemName: "calendar.badge.clock")
        img.tintColor = .white
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    private lazy var cellLabel: UILabel = {
        let label = UILabel()
        label.text = "Treinos agendados: 11"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with model: ProfileCellViewModel) {
        cellImageView.image = model.icon
        cellLabel.text = model.label
    }
}

extension ProfileCell: ViewCode {
    func buildHierarchy() {
        contentView.addSubview(cellImageView)
        contentView.addSubview(cellLabel)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            cellImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            cellImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            cellImageView.heightAnchor.constraint(equalToConstant: 25),
            cellImageView.widthAnchor.constraint(equalToConstant: 25),
            
            cellLabel.leadingAnchor.constraint(equalTo: cellImageView.trailingAnchor, constant: 20),
            cellLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            cellLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
    func applyAdditionalChanges() {
        contentView.backgroundColor = UIColor(named: "dark")
    }
}
