//
//  CommentPost.swift
//  ArmyFitViewCode
//
//  Created by Jean Lucas Vitor on 03/10/22.
//

import Foundation

struct CommentPost: Codable {
    let id: String
    let comment: String
    let feedsId: String
    let usersId: String
    let createdAt: String
    let user: User
    
    enum CodingKeys: String, CodingKey {
        case id, comment, feedsId, usersId
        case createdAt = "created_at"
        case user
    }
}

struct Comments: Codable {
    let comments: Int
    
    enum CodingKeys: String, CodingKey {
        case comments = "feed_comments"
    }
}
