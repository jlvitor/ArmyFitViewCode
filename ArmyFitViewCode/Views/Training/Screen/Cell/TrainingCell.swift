//
//  TrainingCell.swift
//  ArmyFitViewCode
//
//  Created by Jean Lucas Vitor on 30/09/22.
//

import UIKit

class TrainingCell: UITableViewCell {

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
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var minuteLabel: UILabel = {
        let label = UILabel()
        label.text = "00"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var coachLabel: UILabel = {
        let label = UILabel()
        label.text = "Nome do treinador"
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var disclosureImage: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(systemName: "chevron.right")
        img.tintColor = UIColor(named: "green")
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
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
        
        contentView.backgroundColor = UIColor(named: "dark")
        contentView.clipsToBounds = true
        contentView.layer.cornerRadius = 8
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Public method
    func configure(_ viewModel: TrainingDetailViewModel) {
        hourLabel.text = viewModel.getHourTraining
        minuteLabel.text = viewModel.getMinuteTraining
        coachLabel.text = viewModel.getCoachName
    }
}

// MARK: - ViewCode
extension TrainingCell: ViewCode {
    func buildHierarchy() {
        contentView.addSubview(hourStackView)
        contentView.addSubview(coachLabel)
        contentView.addSubview(disclosureImage)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            hourStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            hourStackView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            coachLabel.leadingAnchor.constraint(equalTo: hourStackView.trailingAnchor, constant: 20),
            coachLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            coachLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            disclosureImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            disclosureImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            disclosureImage.heightAnchor.constraint(equalToConstant: 15),
            disclosureImage.widthAnchor.constraint(equalToConstant: 10)
        ])
    }
}
