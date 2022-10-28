//
//  ScheduleDetailViewController.swift
//  ArmyFitViewCode
//
//  Created by Jean Lucas Vitor on 26/10/22.
//

import UIKit

class ScheduleDetailViewController: UIViewController {
    
    private var scheduleDetailScreen: ScheduleDetailScreen?
    
    override func loadView() {
        super.loadView()
        self.scheduleDetailScreen = ScheduleDetailScreen()
        self.scheduleDetailScreen?.configAllDelegates(
            tableDelegate: self,
            tableDataSource: self)
        self.view = self.scheduleDetailScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackground()
        setupNavigationBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        tabBarController?.tabBar.isHidden = false
    }
    
    private func setupBackground() {
        self.view.backgroundColor = UIColor(named: "green")
    }
    
    private func setupNavigationBar() {
        navigationController?.navigationBar.tintColor = .white
    }
}

extension ScheduleDetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65
    }
}

extension ScheduleDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let scheduleDetailCell = tableView.dequeueCell(withType: UserDetailCell.self, for: indexPath) as? UserDetailCell else {
            return UITableViewCell()
        }
        
        scheduleDetailCell.selectionStyle = .none
        scheduleDetailCell.backgroundColor = .clear
        scheduleDetailCell.isUserInteractionEnabled = false
        
        return scheduleDetailCell
    }
}
