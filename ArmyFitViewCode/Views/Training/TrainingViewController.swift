//
//  TrainingViewController.swift
//  ArmyFitViewCode
//
//  Created by Jean Lucas Vitor on 28/09/22.
//

import UIKit

class TrainingViewController: UIViewController {
    
    //MARK: - Private properties
    private var trainingScreen: TrainingScreen?
    private let viewModel: TrainingsViewModel = .init()
    
    //MARK: - Init`s
    override func loadView() {
        super.loadView()
        self.trainingScreen = TrainingScreen()
        self.trainingScreen?.configAllDelegates(
            delegate: self,
            dataSource: self)
        self.view = self.trainingScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackground()
        setupNavigationBar()
        configViewModel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.trainingUserSections = []
        viewModel.fetchTrainingUser(Date.getCurrentDateToDateString())
        trainingScreen?.tableView.reloadData()
    }
    
    //MARK: - Private methods
    private func setupBackground() {
        self.view.backgroundColor = UIColor(named: "light")
    }
    
    private func setupNavigationBar() {
        navigationItem.title = "Treinos"
    }
    
    private func configViewModel() {
        viewModel.delegate = self
    }
}

//MARK: - UITableViewDelegate
extension TrainingViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = TrainingDetailViewController()
        let section = indexPath.section
        let row = indexPath.row
        
        detailVC.viewModel = viewModel.getTrainingDetail(section, row)
        detailVC.modalPresentationStyle = .pageSheet
        navigationController?.present(detailVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65
    }
}

//MARK: - UITableViewDataSource
extension TrainingViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.trainingUserSections[section].trainings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let trainingCell = tableView.dequeueCell(withType: TrainingCell.self, for: indexPath) as? TrainingCell else {
            return UITableViewCell()
        }
        
        let cellViewModel = viewModel.getTrainingCellViewModel(indexPath.section, indexPath.row)
        trainingCell.configure(cellViewModel)
        
        trainingCell.selectionStyle = .none
        trainingCell.backgroundColor = .clear
        
        return trainingCell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.trainingUserSections.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return viewModel.trainingUserSections[section].name
    }
}

// MARK: - TrainingViewModelDelegate
extension TrainingViewController: TrainingViewModelDelegate {
    func reloadData() {
        trainingScreen?.tableView.reloadData()
    }
}
