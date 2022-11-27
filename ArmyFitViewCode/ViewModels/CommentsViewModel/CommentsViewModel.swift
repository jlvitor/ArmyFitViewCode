//
//  CommentsViewModel.swift
//  ArmyFitViewCode
//
//  Created by Jean Lucas Vitor on 17/11/22.
//

import Foundation

protocol CommentsViewModelDelegate {
    func errorGetComments()
}

protocol NewCommentDelegate {
    func commentSuccess()
    func empityComment()
    func reloadData()
}

class CommentsViewModel {
    
    //MARK: - Private propertie
    private let service: PostService = .init()
    
    //MARK: - Public propertie
    var delegate: CommentsViewModelDelegate?
    var newCommentDelegate: NewCommentDelegate?
    var post: Post
    
    //MARK: - Getters
    var getUserImage: String {
        post.user.photoUrl ?? "profile"
    }
    
    var getUserName: String {
        post.user.name.capitalized
    }
    
    var getNumberOfComments: Int {
        post.feedComments?.count ?? 0
    }
    
    var getPost: String {
        post.description
    }
    
    init(post: Post) {
        self.post = post
    }
    
    //MARK: - Public method
    func fetchPost() {
        service.getPost(with: post.id) { post, error in
            guard let post = post else {
                self.delegate?.errorGetComments()
                return
            }
            
            self.post = post
            self.newCommentDelegate?.reloadData()
        }
    }
    
    func makeAComment(with comment: String?) {
        guard let comment = comment else { return }
        
        if comment.contains("Adicione um comentário...") || comment.isEmpty {
            self.newCommentDelegate?.empityComment()
        } else {
            service.commentPost(feedId: post.id, comment: comment) { _, error in
                if error != nil {
                    return
                }
                
                self.newCommentDelegate?.commentSuccess()
            }
        }
    }
    
    func getCommentCellViewModel(at index: Int) -> CommentViewModel? {
        guard let comment = post.feedComments?[index] else { return nil }
        return CommentViewModel(comment)
    }
}
