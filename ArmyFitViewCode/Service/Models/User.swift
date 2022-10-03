//
//  User.swift
//  ArmyFitViewCode
//
//  Created by Jean Lucas Vitor on 03/10/22.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let password: String
    let photoUrl: String?
    var trainingUser: [TrainingUser]?
}
