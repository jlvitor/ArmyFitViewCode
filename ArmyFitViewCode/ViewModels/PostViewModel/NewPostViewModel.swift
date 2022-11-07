//
//  NewPostViewModel.swift
//  ArmyFitViewCode
//
//  Created by Jean Lucas Vitor on 06/11/22.
//

import Foundation

protocol NewPostViewModelDelegate {
    func successMakeNewPost()
    func errorMakeNewPost()
    func empityMakeNewPost()
}

class NewPostViewModel {
    
    //MARK: - Private propertie
    private let service: PostService = .init()
    
    //MARK: - Public propertie
    var delegate: NewPostViewModelDelegate?
    
    //MARK: - Getters
    var getUserImage: String {
        UserDefaults.getValue(key: UserDefaults.Keys.userPhoto) as? String ?? "profile"
    }
    
    var getUserName: String {
        let name = UserDefaults.getValue(key: UserDefaults.Keys.userName) as? String ?? "Usuário sem nome"
        return name.capitalized
    }
    
    //MARK: - Public method
    func makeNewPost(description: String?) {
        guard let description = description else { return }
        
        if description.contains("No que você está pensando?") || description.isEmpty {
            self.delegate?.empityMakeNewPost()
        } else {
            service.makeNewPost(description: description) { _, error in
                if error != nil {
                    self.delegate?.errorMakeNewPost()
                    return
                }
                self.delegate?.successMakeNewPost()
            }
        }
    }
}
