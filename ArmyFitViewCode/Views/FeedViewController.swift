//
//  FeedViewController.swift
//  ArmyFitViewCode
//
//  Created by Jean Lucas Vitor on 28/09/22.
//

import UIKit

class FeedViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackground()
        setupNavigationBar()
    }
    
    private func setupBackground() {
        self.view.backgroundColor = UIColor(named: "green")
    }
    
    private func setupNavigationBar() {
        navigationItem.title = "Feed"
        navigationController?.overrideUserInterfaceStyle = .dark
        navigationController?.navigationBar.backgroundColor = UIColor(named: "green")
    }
}
