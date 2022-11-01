//
//  PostService.swift
//  ArmyFit
//
//  Created by Jean Lucas Vitor on 16/06/22.
//

import Foundation
import KeychainSwift

class PostService {
    
    private let baseUrl: String = "https://armyapi.herokuapp.com"
    private let keychain: KeychainSwift = .init()
    
    // Pega todas as postagens do banco de dados
    func getAllPosts(completion: @escaping ([Post]?, Error?) -> Void) {
        guard let url = URL(string: "\(baseUrl)/feeds" ) else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("Bearer \(keychain.get("token"))", forHTTPHeaderField: "Authorization")
        
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data else { return }
            
            do {
                let posts = try JSONDecoder().decode([Post].self, from: data)
                DispatchQueue.main.async {
                    completion(posts, nil)
                }
            } catch {
                print(error)
                completion(nil, error)
            }
        }
        task.resume()
    }
    
    // Pega uma postagem específica do banco de dados
    func getPost(with postId: String, completion: @escaping (Post?, Error?) -> Void) {
        guard let url = URL(string: "\(baseUrl)/feeds/\(postId)") else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("Bearer \(keychain.get("token"))", forHTTPHeaderField: "Authorization")
        
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data else { return }
            
            do {
                let post = try JSONDecoder().decode(Post.self, from: data)
                DispatchQueue.main.async {
                    completion(post, nil)
                }
            } catch {
                print(error)
                completion(nil, error)
            }
        }
        task.resume()
    }
    
    // Faz uma nova postagem
    func makeNewPost(description: String, completion: @escaping (Post?, Error?) -> Void) {
        guard let url = URL(string: "\(baseUrl)/feeds") else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("Bearer \(keychain.get("token"))", forHTTPHeaderField: "Authorization")
        let body: [String: String] = [
            "description": description
        ]
        request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: .fragmentsAllowed)
        
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data else { return }
            
            do {
                let newPost = try JSONDecoder().decode(Post.self, from: data)
                DispatchQueue.main.async {
                    completion(newPost, nil)
                }
            } catch {
                completion(nil, error)
            }
        }
        task.resume()
    }
    
    // Da like em uma postagem
    func likePost(postId: String, completion: @escaping (LikePost?, Error?) -> Void) {
        guard let url = URL(string: "\(baseUrl)/feeds/\(postId)") else { return}
        
        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("Bearer \(keychain.get("token"))", forHTTPHeaderField: "Authorization")
        
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data else { return }
            
            do {
                let like = try JSONDecoder().decode(LikePost.self, from: data)
                DispatchQueue.main.async {
                    completion(like, nil)
                }
            } catch {
                completion(nil, error)
            }
        }
        task.resume()
    }
    
    // Faz um comentario em uma postagem
    func commentPost(feedId: String, comment: String, completion: @escaping (CommentPost?, Error?) -> Void) {
        guard let url = URL(string: "\(baseUrl)/comments") else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("Bearer \(keychain.get("token"))", forHTTPHeaderField: "Authorization")
        let body: [String: String] = [
            "feedsId": feedId,
            "comment": comment
        ]
        request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: .fragmentsAllowed)
        
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data else { return }

            do {
                let newComment = try JSONDecoder().decode(CommentPost.self, from: data)
                DispatchQueue.main.async {
                    completion(newComment, nil)
                }
            } catch {
                completion(nil, error)
            }
        }
        task.resume()
    }
}
