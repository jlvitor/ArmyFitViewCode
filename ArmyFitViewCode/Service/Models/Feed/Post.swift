//
//  Post.swift
//  ArmyFitViewCode
//
//  Created by Jean Lucas Vitor on 03/10/22.
//

import Foundation

struct Post: Codable {
    let id: String
    let description: String
    let like: Int
    let userId: String
    let createdAt: String
    let user: User
    let comments: Comments?
    let feedComments: [CommentPost]?
    
    enum CodingKeys: String, CodingKey {
        case id, description, like
        case userId = "user_id"
        case createdAt = "created_at"
        case user
        case comments = "_count"
        case feedComments = "feed_comments"
    }
}
