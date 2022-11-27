//
//  CommentViewModel.swift
//  ArmyFitViewCode
//
//  Created by Jean Lucas Vitor on 17/11/22.
//

import Foundation

class CommentViewModel {
    
    private let comment: CommentPost
    
    init(_ comment: CommentPost) {
        self.comment = comment
    }
    
    var getUserImage: String {
        comment.user.photoUrl ?? "profile"
    }
    
    var getUserName: String {
        comment.user.name.capitalized
    }
    
    var getComment: String {
        comment.comment
    }
}
