//
//  TrainingCell.swift
//  ArmyFitViewCode
//
//  Created by Jean Lucas Vitor on 30/09/22.
//

import UIKit

final class TrainingCell: UITableViewCell {

    private lazy var hourStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [hourLabel, minuteLabel])
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.spacing = 0
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var hourLabel: UILabel = {
        let label = UILabel()
        label.text = "05"
        label.textColor = .white.withAlphaComponent(0.5)
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var minuteLabel: UILabel = {
        let label = UILabel()
        label.text = "00"
        label.textColor = .white.withAlphaComponent(0.5)
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var coachLabel: UILabel = {
        let label = UILabel()
        label.text = "Nome do treinador"
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
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
}

extension TrainingCell: ViewCode {
    func buildHierarchy() {
        contentView.addSubview(hourStackView)
        contentView.addSubview(coachLabel)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            hourStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            hourStackView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            coachLabel.leadingAnchor.constraint(equalTo: hourStackView.trailingAnchor, constant: 24),
            coachLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            coachLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
        ])
    }
    
    func applyAdditionalChanges() {
        contentView.backgroundColor = UIColor(named: "dark")
    }
}
