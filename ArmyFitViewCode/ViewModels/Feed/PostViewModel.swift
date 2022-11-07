//
//  PostViewModel.swift
//  ArmyFitViewCode
//
//  Created by Jean Lucas Vitor on 31/10/22.
//

import Foundation

protocol ButtonPressedDelegate {
    func likeButton(sender: Int)
    func commentButton()
}

class PostViewModel {
    
    //MARK: - Private propertie
    private let post: Post
    
    //MARK: - Public propertie
    var delegate: ButtonPressedDelegate?
    
    init(_ post: Post) {
        self.post = post
    }
    
    //MARK: - Getters
    var getUserImage: String {
        post.user.photoUrl ?? "profile"
    }
    
    var getUserName: String {
        post.user.name.capitalized
    }
    
    var getPostText: String {
        post.description
    }
    
    var getPostId: String {
        post.id
    }
    
    //MARK: - Public methods
    func numberOfLikes() -> String {
        if post.like == 0 {
            return "Curtir"
        } else {
            return "Curtir \(post.like)"
        }
    }
    
    func numberOfComments() -> String {
        if let comment = post.comments {
            if comment.comments == 0 {
                return "Comentar"
            } else {
                return "Comentários \(comment.comments)"
            }
        }
        
        return "Comentar"
    }
}
