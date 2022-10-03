//
//  AuthService.swift
//  ArmyFitViewCode
//
//  Created by Jean Lucas Vitor on 03/10/22.
//

import Foundation

final class AuthService {
    
    private let service: ServiceProvider
    private let profileImage: String = "l1nq.com/nMZxZ"
    
    init(service: ServiceProvider = Service()) {
        self.service = service
    }
    
    // Registra o usuário no app/ bando de dados do app
    func registerUser(_ name: String, email: String, password: String, photoUrl: String?, completion: @escaping (Result<User, ServiceError>) -> Void) {
        let parameters = [
            "name": name,
            "email": email,
            "photoUrl": photoUrl ?? profileImage,
            "password": password
        ]
        
        service.makeRequest(endpoint: .users, method: "POST", parameters: parameters) { response in
            DispatchQueue.main.async {
                completion(response)
            }
        }
    }
    
    // Valida o usuario para poder logar no app
    func authUser(email: String, password: String, completion: @escaping (Result<Authentication, ServiceError>) -> Void) {
        let parameters = [
            "email": email,
            "password": password
        ]
        
        service.makeRequest(endpoint: .login, method: "POST", parameters: parameters) { response in
            DispatchQueue.main.async {
                completion(response)
            }
        }
    }
}
