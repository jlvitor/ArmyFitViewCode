//
//  ScheduleViewController.swift
//  ArmyFitViewCode
//
//  Created by Jean Lucas Vitor on 28/09/22.
//

import UIKit

class ScheduleViewController: UIViewController {
    
    private var scheduleScreen: ScheduleScreen?
    
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
        setupBackground()
        setupNavigationBar()
    }
    
    private func setupBackground() {
        self.view.backgroundColor = UIColor(named: "green")
    }
    
    private func setupNavigationBar() {
        navigationItem.title = "Horários"
        navigationController?.overrideUserInterfaceStyle = .dark
        navigationController?.navigationBar.backgroundColor = UIColor(named: "green")
    }
}

// MARK: - UICollectionViewDelegate, UICollectionViewDelegateFlowLayout
extension ScheduleViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 63, height: 80)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 0)
    }
}

// MARK: - UICollectionViewDataSource
extension ScheduleViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let dateCell = collectionView.dequeueCell(withType: DateCell.self, for: indexPath) as? DateCell else {
            return UICollectionViewCell()
        }
        
        dateCell.clipsToBounds = true
        dateCell.layer.cornerRadius = 5
        dateCell.backgroundColor = UIColor(named: "dark")
        
        return dateCell
    }
    
}

// MARK: - UITableViewDelegate
extension ScheduleViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}

// MARK: - UITableViewDataSource
extension ScheduleViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let scheduleCell = tableView.dequeueCell(withType: ScheduleCell.self, for: indexPath) as? ScheduleCell else {
            return UITableViewCell()
        }
        
        scheduleCell.selectionStyle = .none
        scheduleCell.backgroundColor = .clear
        
        return scheduleCell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Horários disponíveis"
    }
}
