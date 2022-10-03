//
//  LikePost.swift
//  ArmyFitViewCode
//
//  Created by Jean Lucas Vitor on 03/10/22.
//

import Foundation

struct LikePost: Codable {
    let id: String
    let description: String
    let like: Int
    let userId: String
    let createdAt: String
    
    enum CodingKeys: String, CodingKey {
        case id, description, like
        case userId = "user_id"
        case createdAt = "created_at"
    }
}
