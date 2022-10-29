//
//  TrainingUserSection.swift
//  ArmyFitViewCode
//
//  Created by Jean Lucas Vitor on 28/10/22.
//

import Foundation

class TrainingUserSection {
    
    //MARK: - Public properties
    var name: String
    var trainings: [TrainingUser] = []
    
    init(name: String, trainings: [TrainingUser]) {
        self.name = name
        self.trainings = trainings
    }
}
