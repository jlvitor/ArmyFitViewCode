//
//  Training.swift
//  ArmyFitViewCode
//
//  Created by Jean Lucas Vitor on 03/10/22.
//

import Foundation

struct Training: Codable {
    let id: String
    let name: String
    let createdAt: String
    let warning: String
    var trainingHours: [TrainingHours]?
    
    enum CodingKeys: String, CodingKey {
        case id, name
        case createdAt = "created_at"
        case warning, trainingHours
    }
}
