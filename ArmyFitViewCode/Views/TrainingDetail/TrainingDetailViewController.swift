//
//  TrainingDetailViewController.swift
//  ArmyFitViewCode
//
//  Created by Jean Lucas Vitor on 28/10/22.
//

import UIKit

class TrainingDetailViewController: UIViewController {
    
    private var trainingDetailScreen: TrainingDetailScreen?
    
    override func loadView() {
        super.loadView()
        self.trainingDetailScreen = TrainingDetailScreen()
        self.view = self.trainingDetailScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackground()
    }
    
    //MARK: - Private methods
    private func setupBackground() {
        self.view.backgroundColor = UIColor(named: "light")
    }
}
