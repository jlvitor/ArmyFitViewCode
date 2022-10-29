//
//  TrainingDetailViewModel.swift
//  ArmyFitViewCode
//
//  Created by Jean Lucas Vitor on 28/10/22.
//

import Foundation

class TrainingDetailViewModel {
    
    //MARK: - Private propertie
    private let trainingDetail: TrainingUser
    
    init(_ trainingDetail: TrainingUser) {
        self.trainingDetail = trainingDetail
    }
    
    //MARK: - Getters
    var getHourTraining: String {
        Date.formatDateStringToHour(date: trainingDetail.trainingHours?.dateHour ?? "")
    }
    
    var getMinuteTraining: String {
        Date.formatDateStringToMinute(date: trainingDetail.trainingHours?.dateHour ?? "")
    }
    
    var getCoachName: String {
        trainingDetail.trainingHours?.instructor.uppercased() ?? ""
    }
}
