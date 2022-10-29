//
//  TrainingDetailViewController.swift
//  ArmyFitViewCode
//
//  Created by Jean Lucas Vitor on 28/10/22.
//

import UIKit

class TrainingDetailViewController: UIViewController {
    
    var viewModel: TrainingViewModel?
    
    private var trainingDetailScreen: TrainingDetailScreen?
    
    override func loadView() {
        super.loadView()
        self.trainingDetailScreen = TrainingDetailScreen()
        self.view = self.trainingDetailScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackground()
        setLabels()
    }
    
    //MARK: - Private methods
    private func setupBackground() {
        self.view.backgroundColor = UIColor(named: "light")
    }
    
    private func setLabels() {
        guard let viewModel else { return }
        
        trainingDetailScreen?.configureLabel(viewModel)
    }
}
