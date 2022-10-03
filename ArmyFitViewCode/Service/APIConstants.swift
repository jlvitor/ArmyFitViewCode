//
//  APIConstants.swift
//  ArmyFitViewCode
//
//  Created by Jean Lucas Vitor on 03/10/22.
//

import Foundation

enum APIConstants {
    static let baseURL = "https://armyapi.herokuapp.com/"
    
    enum Endpoints {
        case users
        case login
        case feeds
        case post(String)
        case like(String)
        case comments
        case trainings(String)
        case training(String)
        case joinTrainingUsers
        case removeTrainingUsers(String, String)
        case getTrainingUsers(String)
        
        var path: String {
            switch self {
            case .users:
                return "users"
            case .login:
                return "login"
            case .feeds:
                return "feeds"
            case .post(let postId):
                return "feeds/\(postId)"
            case .like(let postId):
                return "feeds/\(postId)"
            case .comments:
                return "comments"
            case .trainings(let date):
                return "hours/\(date)"
            case .training(let trainingId):
                return "hours/training/\(trainingId)"
            case .joinTrainingUsers:
                return "trainingusers"
            case .removeTrainingUsers(let userId, let trainingHoursId):
                return "trainingusers/\(userId)/\(trainingHoursId)"
            case .getTrainingUsers(let date):
                return "trainingusers/\(date)"
            }
        }
        
        var urlString: String {
            return APIConstants.baseURL + self.path
        }
    }
}
