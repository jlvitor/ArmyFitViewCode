//
//  DateCell.swift
//  ArmyFitViewCode
//
//  Created by Jean Lucas Vitor on 16/10/22.
//

import UIKit

class DateCell: UICollectionViewCell {
    
    private lazy var dateTexLabel: UILabel = {
        let label = UILabel()
        label.text = "SEG"
        label.textColor = UIColor(named: "light")
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var dateNumberLabel: UILabel = {
        let label = UILabel()
        label.text = "16"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
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
    
    func configure(_ viewModel: DayViewModel) {
        dateTexLabel.text = viewModel.getDayStringInAMonth
        dateNumberLabel.text = viewModel.getDayIntInAMonth
    }
}

extension DateCell: ViewCode {
    func buildHierarchy() {
        contentView.addSubview(dateTexLabel)
        contentView.addSubview(dateNumberLabel)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            dateTexLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 14),
            dateTexLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            dateNumberLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -14),
            dateNumberLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
        ])
    }
}
