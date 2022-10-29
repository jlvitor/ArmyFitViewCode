//
//  TrainingViewModel.swift
//  ArmyFitViewCode
//
//  Created by Jean Lucas Vitor on 29/10/22.
//

import Foundation

class TrainingViewModel {
    
    //MARK: - Private methods
    private var trainingDetail: TrainingUser
    
    init(trainingDetail: TrainingUser) {
        self.trainingDetail = trainingDetail
    }
    
    //MARK: - Getters
    var getExerciseName: String {
        trainingDetail.trainingHours?.training.name ?? "Não foi possivel carregar o nome desse treino"
    }
    
    var getWarning: String {
        trainingDetail.trainingHours?.training.warning ?? "Não foi possivel carregar o aviso desse treino"
    }
    
    var getDetail: String {
        trainingDetail.trainingHours?.description ?? "Não foi possivel carregar os detalhes desse treino"
    }
}
