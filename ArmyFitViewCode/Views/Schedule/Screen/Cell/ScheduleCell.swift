//
//  ScheduleCell.swift
//  ArmyFitViewCode
//
//  Created by Jean Lucas Vitor on 16/10/22.
//

import UIKit

class ScheduleCell: UITableViewCell {
    
    private lazy var hourStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [hourLabel, minuteLabel])
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    lazy var hourLabel: UILabel = {
        let label = UILabel()
        label.text = "05"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var minuteLabel: UILabel = {
        let label = UILabel()
        label.text = "00"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var exerciseStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [exerciseTitleLabel, coachLabel])
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    lazy var exerciseTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "CROSSFIT"
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var coachLabel: UILabel = {
        let label = UILabel()
        label.text = "FERNANDA"
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var viewAccessory: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var accessoryStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [spotsStackView, spotsImageView])
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .fill
        stack.spacing = 5
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var spotsStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [spotsLabel, dividerLabel, availableSpotsLabel])
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    lazy var spotsLabel: UILabel = {
        let label = UILabel()
        label.text = "11"
        label.textColor = .gray
        label.textAlignment = .right
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var dividerLabel: UILabel = {
        let label = UILabel()
        label.text = "/"
        label.textColor = .gray
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var availableSpotsLabel: UILabel = {
        let label = UILabel()
        label.text = "22"
        label.textColor = .gray
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var spotsImageView: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(systemName: "person.3.fill")
        img.tintColor = .gray
        img.contentMode = .scaleAspectFit
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    private lazy var disclosureImage: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(systemName: "chevron.right")
        img.tintColor = .white
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
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
        contentView.layer.cornerRadius = 5
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ScheduleCell: ViewCode {
    func buildHierarchy() {
        contentView.addSubview(hourStackView)
        contentView.addSubview(exerciseStackView)
        contentView.addSubview(viewAccessory)
        viewAccessory.addSubview(accessoryStackView)
        contentView.addSubview(disclosureImage)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            hourStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            hourStackView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            exerciseStackView.leadingAnchor.constraint(equalTo: hourStackView.trailingAnchor, constant: 20),
            exerciseStackView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            viewAccessory.trailingAnchor.constraint(equalTo: disclosureImage.leadingAnchor, constant: -20),
            viewAccessory.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            viewAccessory.heightAnchor.constraint(equalToConstant: 44),
            viewAccessory.widthAnchor.constraint(equalToConstant: 90),
            
            accessoryStackView.topAnchor.constraint(equalTo: viewAccessory.topAnchor),
            accessoryStackView.leadingAnchor.constraint(equalTo: viewAccessory.leadingAnchor),
            accessoryStackView.trailingAnchor.constraint(equalTo: viewAccessory.trailingAnchor),
            accessoryStackView.bottomAnchor.constraint(equalTo: viewAccessory.bottomAnchor),
            
            spotsImageView.widthAnchor.constraint(equalToConstant: 25),
            
            disclosureImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            disclosureImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            disclosureImage.heightAnchor.constraint(equalToConstant: 15),
            disclosureImage.widthAnchor.constraint(equalToConstant: 10)
        ])
    }
}
