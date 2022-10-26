//
//  ScheduleViewModel.swift
//  ArmyFitViewCode
//
//  Created by Jean Lucas Vitor on 16/10/22.
//

import Foundation

class ScheduleViewModel {
    
    //MARK: - Private propertie
    private let trainingHours: TrainingHours
    
    init(_ trainingHours: TrainingHours) {
        self.trainingHours = trainingHours
    }
    
    //MARK: - Getters
    var getHourTraining: String {
        Date.formatDateStringToHour(date: trainingHours.dateHour)
    }
    
    var getMinuteTraining: String {
        Date.formatDateStringToMinute(date: trainingHours.dateHour)
    }
    
    var getTrainingName: String {
        trainingHours.training.name.uppercased()
    }
    
    var getCoachName: String {
        trainingHours.instructor.uppercased()
    }
    
    var getAvailableSpots: String {
        "\(trainingHours.availableSpots)"
    }
    
    var getSpots: String {
        "\(trainingHours.spots)"
    }
}
