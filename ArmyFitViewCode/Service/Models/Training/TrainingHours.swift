//
//  TrainingHours.swift
//  ArmyFitViewCode
//
//  Created by Jean Lucas Vitor on 03/10/22.
//

import Foundation

struct TrainingHours: Codable {
    let id: String
    let dateHour: String
    let spots: Int
    let availableSpots: Int
    let instructor: String
    let description: String
    let training: Training
    let trainingId: String?
    let trainingUsers: [TrainingUser]?
    
    enum CodingKeys: String, CodingKey {
        case id
        case dateHour = "date_hour"
        case spots
        case availableSpots = "available_spots"
        case instructor, description, training
        case trainingId = "training_id"
        case trainingUsers = "training_users"
    }
}
