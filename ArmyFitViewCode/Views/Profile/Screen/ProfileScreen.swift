//
//  ProfileScreen.swift
//  ArmyFitViewCode
//
//  Created by Jean Lucas Vitor on 13/10/22.
//

import UIKit

class ProfileScreen: UIView {
    
    private lazy var greenView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "green")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var lightView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "light")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var profileView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "light")
        view.clipsToBounds = true
        view.layer.cornerRadius = 65
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var profileImageView: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "jean")
        img.clipsToBounds = true
        img.layer.cornerRadius = 60
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    private lazy var labelStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [nameLabel, statusLabel])
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.spacing = -60
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Jean Lucas Vitor"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var statusLabel: UILabel = {
        let label = UILabel()
        label.text = "Ativo"
        label.textColor = UIColor(named: "green")
        label.font = UIFont.systemFont(ofSize: 17)
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = UIColor(named: "light")
        tableView.bounces = false
        tableView.showsVerticalScrollIndicator = false
        tableView.rowHeight = UITableView.automaticDimension
        tableView.registerCell(type: ProfileCell.self)
        tableView.separatorStyle = .none
        tableView.overrideUserInterfaceStyle = .dark
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func delegateTableView(delegate: UITableViewDelegate, dataSource: UITableViewDataSource) {
        self.tableView.delegate = delegate
        self.tableView.dataSource = dataSource
    }
}

//MARK: - ViewCode
extension ProfileScreen: ViewCode {
    func buildHierarchy() {
        self.addSubview(greenView)
        self.addSubview(lightView)
        lightView.addSubview(profileView)
        lightView.addSubview(labelStackView)
        profileView.addSubview(profileImageView)
        self.addSubview(tableView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            greenView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            greenView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            greenView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            greenView.heightAnchor.constraint(equalToConstant: 70),
            
            lightView.topAnchor.constraint(equalTo: greenView.bottomAnchor),
            lightView.leadingAnchor.constraint(equalTo: greenView.leadingAnchor),
            lightView.trailingAnchor.constraint(equalTo: greenView.trailingAnchor),
            lightView.heightAnchor.constraint(equalToConstant: 70),
            
            profileView.leadingAnchor.constraint(equalTo: lightView.leadingAnchor, constant: 20),
            profileView.bottomAnchor.constraint(equalTo: lightView.bottomAnchor, constant: -10),
            profileView.heightAnchor.constraint(equalToConstant: 130),
            profileView.widthAnchor.constraint(equalToConstant: 130),
            
            profileImageView.centerXAnchor.constraint(equalTo: profileView.centerXAnchor),
            profileImageView.centerYAnchor.constraint(equalTo: profileView.centerYAnchor),
            profileImageView.heightAnchor.constraint(equalToConstant: 120),
            profileImageView.widthAnchor.constraint(equalToConstant: 120),
            
            labelStackView.leadingAnchor.constraint(equalTo: profileView.trailingAnchor, constant: 16),
            labelStackView.bottomAnchor.constraint(equalTo: lightView.bottomAnchor, constant: -14),
            labelStackView.heightAnchor.constraint(equalToConstant: 110),
            
            tableView.topAnchor.constraint(equalTo: lightView.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
}
