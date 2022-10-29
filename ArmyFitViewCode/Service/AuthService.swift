//
//  AuthService.swift
//  ArmyFitViewCode
//
//  Created by Jean Lucas Vitor on 03/10/22.
//

import Foundation

class AuthService {
    
    private let baseUrl = "https://armyapi.herokuapp.com"
    private let profileImage: String = "l1nq.com/nMZxZ"
    
    // Registra o usuário no app/ bando de dados do app
    func registerUser(name: String, email: String, password: String, photoUrl: String?, completion: @escaping (User?, Error?) -> Void) {
        guard let url = URL(string: "\(baseUrl)/users") else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let body: [String: String] = [
            "name": name,
            "email": email,
            "photoUrl": photoUrl ?? profileImage,
            "password": password
        ]
        
        request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: .fragmentsAllowed)
        
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data, error == nil else { return }
            
            do {
                let register = try JSONDecoder().decode(User.self, from: data)
                DispatchQueue.main.async {
                    completion(register, nil)
                }
            } catch {
                completion(nil, error)
            }
        }
        task.resume()
    }
    
    // Valida o usuario para poder logar no app
    func authUser(email: String, password:  String, completion:  @escaping (Authentication?, Error?) -> Void) {
        guard let url = URL(string: "\(baseUrl)/login") else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let body: [String: String] = [
            "email": email,
            "password": password
        ]
        
        request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: .fragmentsAllowed)
        
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data, error == nil else { return }
            
            do {
                let auth = try JSONDecoder().decode(Authentication.self, from: data)
                DispatchQueue.main.async {
                    completion(auth, nil)
                }
            } catch {
                DispatchQueue.main.async {
                    completion(nil, error)
                }
            }
        }
        task.resume()
    }
}
