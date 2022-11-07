//
//  ScheduleViewController.swift
//  ArmyFitViewCode
//
//  Created by Jean Lucas Vitor on 28/09/22.
//

import UIKit

class ScheduleViewController: BaseViewController {
    
    private var scheduleScreen: ScheduleScreen?
    private let viewModel: SchedulesViewModel = .init()
    
    override func loadView() {
        super.loadView()
        self.scheduleScreen = ScheduleScreen()
        self.scheduleScreen?.configAllDelegates(
            collectionDelegate: self,
            collectionDataSource: self,
            tableDelegate: self,
            tableDataSource: self)
        self.view = self.scheduleScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configViewModel()
        setupNavigationBar("Horários")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let date = viewModel.date {
            viewModel.fetchTrainingsHours(date)
        }
    }
    
    private func configViewModel() {
        viewModel.delegate = self
        viewModel.getRemainingDaysInAMonth()
        viewModel.fetchTrainingsHours(Date.getCurrentDateToDateString())
    }
}

// MARK: - UICollectionViewDelegate, UICollectionViewDelegateFlowLayout
extension ScheduleViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 63, height: 80)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 12)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let day = viewModel.trainingDays[indexPath.item].0
        let date = viewModel.getDayStringToDateString(day)
        
        viewModel.fetchTrainingsHours(date)
        viewModel.cellSelected = indexPath.row
        viewModel.date = date
        collectionView.reloadData()
    }
}

// MARK: - UICollectionViewDataSource
extension ScheduleViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.trainingDays.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let dateCell = collectionView.dequeueCell(withType: DateCell.self, for: indexPath) as? DateCell else {
            return UICollectionViewCell()
        }
        
        let cellViewModel = viewModel.getDayCellViewModel(indexPath.row)
        
        dateCell.configure(cellViewModel)
        dateCell.clipsToBounds = true
        dateCell.layer.cornerRadius = 8
        dateCell.backgroundColor = UIColor(named: "dark")
        
        viewModel.configCellBackgroundColorWhenSelected(dateCell, at: indexPath.row)
        
        return dateCell
    }
    
}

// MARK: - UITableViewDelegate
extension ScheduleViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = ScheduleDetailViewController()
        let index = indexPath.row
        vc.viewModel = viewModel.getTrainingHoursDetail(index)
        
        navigationController?.pushViewController(vc, animated: true)
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}

// MARK: - UITableViewDataSource
extension ScheduleViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.trainingHoursCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let scheduleCell = tableView.dequeueCell(withType: ScheduleCell.self, for: indexPath) as? ScheduleCell else {
            return UITableViewCell()
        }
        
        let cellViewModel = viewModel.getTrainingCellViewModel(indexPath.row)
        
        scheduleCell.configure(cellViewModel)
        scheduleCell.selectionStyle = .none
        scheduleCell.backgroundColor = .clear
        
        return scheduleCell
    }
}

// MARK: - SchedulesViewModelDelegate
extension ScheduleViewController: SchedulesViewModelDelegate {
    func reloadData() {
        scheduleScreen?.scheduleTableView.reloadData()
    }
}
