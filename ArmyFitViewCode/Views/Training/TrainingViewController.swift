//
//  TrainingViewController.swift
//  ArmyFitViewCode
//
//  Created by Jean Lucas Vitor on 28/09/22.
//

import UIKit

class TrainingViewController: UIViewController {
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = UIColor(named: "light")
        tableView.bounces = false
        tableView.showsVerticalScrollIndicator = false
        tableView.rowHeight = UITableView.automaticDimension
        tableView.registerCell(type: TrainingCell.self)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupNavigationBar() {
        navigationItem.title = "Treinos"
        navigationController?.navigationBar.backgroundColor = UIColor(named: "green")
    }
}

extension TrainingViewController: ViewCode {
    func buildHierarchy() {
        view.addSubview(tableView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func applyAdditionalChanges() {
        setupNavigationBar()
        view.backgroundColor = UIColor(named: "green")
    }
}

//MARK: - UITableViewDelegate
extension TrainingViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65
    }
}

//MARK: - UITableViewDataSource
extension TrainingViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let trainingCell = tableView.dequeueCell(withType: TrainingCell.self, for: indexPath) as? TrainingCell else {
            return UITableViewCell()
        }
        
        return trainingCell
    }
}
