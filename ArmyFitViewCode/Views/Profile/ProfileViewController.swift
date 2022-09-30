//
//  ProfileViewController.swift
//  ArmyFitViewCode
//
//  Created by Jean Lucas Vitor on 28/09/22.
//

import UIKit

class ProfileViewController: UIViewController {
    
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
        img.layer.cornerRadius = 55
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
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = UIColor(named: "light")
        tableView.bounces = false
        tableView.showsVerticalScrollIndicator = false
        tableView.rowHeight = UITableView.automaticDimension
        tableView.registerCell(type: ProfileCell.self)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupNavigationBar() {
        navigationItem.title = "Perfil"
        navigationController?.navigationBar.backgroundColor = UIColor(named: "green")
       
        let barButtonItem = UIBarButtonItem(
            barButtonSystemItem: .compose,
            target: self,
            action: #selector(barButtonTapped))
        
        navigationItem.rightBarButtonItem = barButtonItem
        navigationItem.rightBarButtonItem?.tintColor = .white
    }
    
    @objc private func barButtonTapped() {
        print("Teste")
    }
}

//MARK: - ViewCode
extension ProfileViewController: ViewCode {
    func buildHierarchy() {
        view.addSubview(greenView)
        view.addSubview(lightView)
        lightView.addSubview(profileView)
        lightView.addSubview(labelStackView)
        profileView.addSubview(profileImageView)
        view.addSubview(tableView)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            greenView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            greenView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            greenView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
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
            profileImageView.heightAnchor.constraint(equalToConstant: 110),
            profileImageView.widthAnchor.constraint(equalToConstant: 110),
            
            labelStackView.leadingAnchor.constraint(equalTo: profileView.trailingAnchor, constant: 16),
            labelStackView.bottomAnchor.constraint(equalTo: lightView.bottomAnchor, constant: -14),
            labelStackView.heightAnchor.constraint(equalToConstant: 110),
            
            tableView.topAnchor.constraint(equalTo: lightView.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    func applyAdditionalChanges() {
        setupNavigationBar()
        view.backgroundColor = UIColor(named: "green")
    }
}

//MARK: - UITableViewDelegate
extension ProfileViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
}

//MARK: - UITableViewDataSource
extension ProfileViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let profileCell = tableView.dequeueCell(withType: ProfileCell.self, for: indexPath) as? ProfileCell else {
            return UITableViewCell()
        }
        
        return profileCell
    }
}
