//
//  Service.swift
//  ArmyFitViewCode
//
//  Created by Jean Lucas Vitor on 03/10/22.
//

import Foundation

protocol ServiceProvider {
    func makeRequest<T: Codable>(endpoint: APIConstants.Endpoints, method: String, parameters: [String: String?]?, completion: @escaping (Result<T, ServiceError>) -> Void)
}

final class Service: ServiceProvider {
    
    // MARK: Properties
    private let session: URLSession = {
        let config = URLSessionConfiguration.default
        config.allowsCellularAccess = false
        config.httpAdditionalHeaders = ["Content-Type": "aplication/json"]
        config.timeoutIntervalForRequest = 30.0
        config.httpMaximumConnectionsPerHost = 5
        return URLSession(configuration: config)
    }()
    
    func makeRequest<T>(endpoint: APIConstants.Endpoints, method: String, parameters: [String: String?]?, completion: @escaping (Result<T, ServiceError>) -> Void) where T : Decodable, T : Encodable {
        
        guard var components = URLComponents(string: endpoint.urlString) else { return }
        
        components.queryItems = parameters?.map { key, value in
            URLQueryItem(name: key, value: value)
        }
        
        guard let url = components.url else { return }
        var request = URLRequest(url: url)
        request.httpMethod = method
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("Bearer /token", forHTTPHeaderField: "Authorization")
        
        let dataTask = session.dataTask(with: request) { (data: Data?, response: URLResponse?, error: Error?) in
            
            guard error == nil,
                  let response = response as? HTTPURLResponse,
                  let data = data else {
                completion(.failure(ServiceError.badRequest))
                return
            }
            
            do {
                guard response.statusCode == 200 else {
                    completion(.failure(ServiceError.statusCode(response.statusCode)))
                    return
                }
                
                let codable = try JSONDecoder().decode(T.self, from: data)
                completion(.success(codable))
            } catch {
                print("Unexpected error: \(error).")
                completion(.failure(ServiceError.parseError))
            }
        }
        dataTask.resume()
    }
}
