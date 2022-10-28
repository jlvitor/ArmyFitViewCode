//
//  ScheduleDetailScreen.swift
//  ArmyFitViewCode
//
//  Created by Jean Lucas Vitor on 26/10/22.
//

import UIKit

protocol ScheduleDetailScreenProtocol: AnyObject {
    func registerButtonAction()
}

class ScheduleDetailScreen: UIView {
    
    private weak var delegate: ScheduleDetailScreenProtocol?
    
    private lazy var detailView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "light")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var dateView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "green")
        view.clipsToBounds = true
        view.layer.cornerRadius = 8
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var dateTexLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(named: "light")
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var dateNumberLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var detailStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [hourStackView, secondStackView])
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .fillProportionally
        stack.spacing = 12
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var hourStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [hourLabel, minuteLabel])
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var hourLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var minuteLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var secondStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [coachLabel, thirdStackView])
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.spacing = 4
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var coachLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var thirdStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [spotsImageView, spotsLabel])
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .fill
        stack.spacing = 8
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var spotsImageView: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(systemName: "person.3.fill")
        img.tintColor = .white
        img.contentMode = .scaleAspectFit
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    private lazy var spotsLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var detailTableView: UITableView = {
        let table = UITableView()
        table.backgroundColor = UIColor(named: "light")
        table.bounces = false
        table.showsVerticalScrollIndicator = false
        table.rowHeight = UITableView.automaticDimension
        table.registerCell(type: UserDetailCell.self)
        table.separatorStyle = .none
        table.overrideUserInterfaceStyle = .dark
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    private lazy var buttonView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "dark")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var registerTrainingButton: UIButton = {
        let btn = UIButton()
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        btn.backgroundColor = UIColor(named: "green")
        btn.clipsToBounds = true
        btn.layer.cornerRadius = 8
        btn.addTarget(self, action: #selector(tappedRegisterButton), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func tappedRegisterButton() {
        self.delegate?.registerButtonAction()
    }
    
    func configAllDelegates(
        delegate: ScheduleDetailScreenProtocol?,
        tableDelegate: UITableViewDelegate,
        tableDataSource: UITableViewDataSource) {
            self.delegate = delegate
            detailTableView.delegate = tableDelegate
            detailTableView.dataSource = tableDataSource
        }
    
    func configScreen(_ viewModel: ScheduleDetailViewModel) {
        dateTexLabel.text = viewModel.getDayName
        dateNumberLabel.text = viewModel.getDayNumber
        hourLabel.text = viewModel.getHourTraining
        minuteLabel.text = viewModel.getMinuteTraining
        coachLabel.text = viewModel.getCoachName
        spotsLabel.text = viewModel.getSpots
        registerTrainingButton.setTitle(viewModel.getRegisterButtonTitle(), for: .normal)
    }
}

extension ScheduleDetailScreen: ViewCode {
    func buildHierarchy() {
        self.addSubview(detailView)
        self.detailView.addSubview(dateView)
        self.dateView.addSubview(dateTexLabel)
        self.dateView.addSubview(dateNumberLabel)
        self.detailView.addSubview(detailStackView)
        self.addSubview(detailTableView)
        self.addSubview(buttonView)
        self.buttonView.addSubview(registerTrainingButton)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            detailView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            detailView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            detailView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            dateView.topAnchor.constraint(equalTo: detailView.topAnchor, constant: 12),
            dateView.leadingAnchor.constraint(equalTo: detailView.leadingAnchor, constant: 12),
            dateView.bottomAnchor.constraint(equalTo: detailView.bottomAnchor, constant: -12),
            dateView.heightAnchor.constraint(equalToConstant: 80),
            dateView.widthAnchor.constraint(equalToConstant: 63),
            
            dateTexLabel.topAnchor.constraint(equalTo: dateView.topAnchor, constant: 14),
            dateTexLabel.centerXAnchor.constraint(equalTo: dateView.centerXAnchor),
            
            dateNumberLabel.bottomAnchor.constraint(equalTo: dateView.bottomAnchor, constant: -14),
            dateNumberLabel.centerXAnchor.constraint(equalTo: dateView.centerXAnchor),
            
            detailStackView.leadingAnchor.constraint(equalTo: dateView.trailingAnchor, constant: 12),
            detailStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -12),
            detailStackView.centerYAnchor.constraint(equalTo: dateView.centerYAnchor),
            
            spotsImageView.heightAnchor.constraint(equalToConstant: 20),
            spotsImageView.widthAnchor.constraint(equalToConstant: 25),
            
            detailTableView.topAnchor.constraint(equalTo: detailView.bottomAnchor),
            detailTableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            detailTableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            buttonView.topAnchor.constraint(equalTo: detailTableView.bottomAnchor),
            buttonView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            buttonView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            buttonView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            registerTrainingButton.topAnchor.constraint(equalTo: buttonView.topAnchor, constant: 12),
            registerTrainingButton.leadingAnchor.constraint(equalTo: buttonView.leadingAnchor, constant: 12),
            registerTrainingButton.trailingAnchor.constraint(equalTo: buttonView.trailingAnchor, constant: -12),
            registerTrainingButton.bottomAnchor.constraint(equalTo: buttonView.bottomAnchor, constant: -34),
            registerTrainingButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
}
