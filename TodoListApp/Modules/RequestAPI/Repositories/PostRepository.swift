//
//  PostRepository.swift
//  TodoListApp
//
//  Created by 逸唐陳 on 2023/8/2.
//

import Foundation

protocol PostRepository {
    func getPost(completion: @escaping ((Result<Post, Error>) -> Void))
}

class PostRepositoryImpl: PostRepository {
    
    private let client: APIClient
    private let parser: DataParser
    
    init(client: APIClient = APIClientImpl(), parser: DataParser = JSONDataParser()) {
        self.parser = parser
        #if DEBUG
        if ProcessInfo.processInfo.environment["showError"] == "true" {
            self.client = APIClientMock()
        } else {
            self.client = client
        }
        #else
        self.client = client
        #endif
    }
    
    func getPost(completion: @escaping ((Result<Post, Error>) -> Void)) {
        let apiRequest = APIRequestImpl(method: .get, path: .post)
        client.performRequest(apiRequest: apiRequest) { [weak self] result in
            switch result {
            case .success(let data):
                do {
                    guard let self = self else { return }
                    let post = try self.parser.parse(type: Post.self, data: data)
                    completion(.success(post))
                } catch let error {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
