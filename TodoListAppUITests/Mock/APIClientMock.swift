//
//  APIClientMock.swift
//  TodoListApp
//
//  Created by 逸唐陳 on 2023/8/4.
//

import Foundation

class APIClientMock: APIClient {
    
    func performRequest(apiRequest: APIRequest, completion: @escaping ((Result<Data, Error>) -> Void)) {
        completion(.failure(APIRequestError.requestFailed))
    }
    
}
