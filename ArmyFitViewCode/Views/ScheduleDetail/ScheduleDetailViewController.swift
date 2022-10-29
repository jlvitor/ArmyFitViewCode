//
//  ScheduleDetailViewController.swift
//  ArmyFitViewCode
//
//  Created by Jean Lucas Vitor on 26/10/22.
//

import UIKit

class ScheduleDetailViewController: UIViewController {
    
    //MARK: - Public propertie
    var viewModel: ScheduleDetailViewModel?
    
    //MARK: - Private propertie
    private var scheduleDetailScreen: ScheduleDetailScreen?
    
    // Init`s
    override func loadView() {
        super.loadView()
        self.scheduleDetailScreen = ScheduleDetailScreen()
        self.scheduleDetailScreen?.configAllDelegates(
            delegate: self,
            tableDelegate: self,
            tableDataSource: self)
        self.view = self.scheduleDetailScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackground()
        setupNavigationBar()
        configViewModel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        tabBarController?.tabBar.isHidden = false
    }
    
    // MARK: - Private methods
    private func setupBackground() {
        self.view.backgroundColor = UIColor(named: "light")
    }
    
    private func setupNavigationBar() {
        navigationController?.navigationBar.tintColor = .white
    }
    
    private func configViewModel() {
        guard let viewModel = viewModel else { return }
        
        viewModel.delegate = self
        viewModel.registerDelegate = self
        viewModel.fetchTrainingsHours {
            self.scheduleDetailScreen?.configScreen(viewModel)
        }
    }
}

// MARK: - UITableViewDelegate
extension ScheduleDetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65
    }
}

// MARK: - UITableViewDataSource
extension ScheduleDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.getNumberOfUsers ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let scheduleDetailCell = tableView.dequeueCell(withType: UserDetailCell.self, for: indexPath) as? UserDetailCell else {
            return UITableViewCell()
        }
        
        if let cellViewModel = viewModel?.getTrainingDetailCellViewModel() {
            scheduleDetailCell.configure(at: indexPath.row, cellViewModel)
        }
        
        scheduleDetailCell.selectionStyle = .none
        scheduleDetailCell.backgroundColor = .clear
        scheduleDetailCell.isUserInteractionEnabled = false
        
        return scheduleDetailCell
    }
}

// MARK: - ScheduleDetailScreenProtocol
extension ScheduleDetailViewController: ScheduleDetailScreenProtocol {
    func registerButtonAction() {
        viewModel?.registerButtonPressed()
    }
}

// MARK: - RegisterOnTrainingDelegate
extension ScheduleDetailViewController: RegisterOnTrainingDelegate {
    func showAlertAddUserOnTraining() {
        let confirmAlert = UIAlertController(
            title: "Confirmação",
            message: "Deseja confirmar sua participação?",
            preferredStyle: .alert)
        
        let confirm = UIAlertAction(
            title: "Ok",
            style: .default) { action in
            self.viewModel?.addUserOnTraining()
        }
        
        let cancel = UIAlertAction(
            title: "Cancelar",
            style: .cancel)
        
        confirmAlert.addAction(confirm)
        confirmAlert.addAction(cancel)
        self.present(confirmAlert, animated: true)
    }
    
    func showAlertRemoveUserOnTraining() {
        let confirmAlert = UIAlertController(
            title: "Confirmação",
            message: "Deseja confirmar sua saida do treino?",
            preferredStyle: .alert)
        
        let confirm = UIAlertAction(
            title: "Ok",
            style: .default) { action in
            self.viewModel?.removeUserOnTraining()
        }
        
        let cancel = UIAlertAction(
            title: "Cancelar",
            style: .cancel)
        
        confirmAlert.addAction(confirm)
        confirmAlert.addAction(cancel)
        self.present(confirmAlert, animated: true)
    }
    
    func success() {
        guard let viewModel = viewModel else { return }
        
        viewModel.fetchTrainingsHours {
            self.scheduleDetailScreen?.configScreen(viewModel)
        }
    }
}

// MARK: - ScheduleDetailViewModelDelegate
extension ScheduleDetailViewController: ScheduleDetailViewModelDelegate {
    func reloadData() {
        scheduleDetailScreen?.detailTableView.reloadData()
    }
}
