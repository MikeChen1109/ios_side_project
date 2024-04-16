//
//  Networking.swift
//  TodoListApp
//
//  Created by 逸唐陳 on 2023/8/3.
//

import Foundation

typealias APIClientHandler = ((Result<Data, Error>) -> Void)

protocol APIClient {
    func performRequest(apiRequest: APIRequest, completion: @escaping APIClientHandler)
}

class APIClientImpl: APIClient {
    func performRequest(apiRequest: APIRequest, completion: @escaping APIClientHandler) {
        do {
            let request = try apiRequest.makeRequest()
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                if let error = error {
                    completion(.failure(error))
                }
                if let data = data {
                    completion(.success(data))
                }
            }
            task.resume()
        }catch(let error) {
            completion(.failure(error))
        }
    }
}
