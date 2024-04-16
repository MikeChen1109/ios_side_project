//
//  MockAPIClientFailure.swift
//  TodoListApp
//
//  Created by 逸唐陳 on 2023/8/5.
//

import Foundation


class MockAPIClientFailure: APIClient {
    
    func performRequest(apiRequest: APIRequest, completion: @escaping ((Result<Data, Error>) -> Void)) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: {
            completion(.failure(APIRequestError.requestFailed))
        })
    }

}
