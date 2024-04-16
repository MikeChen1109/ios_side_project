//
//  MockAPIClientSuccess.swift
//  TodoListApp
//
//  Created by 逸唐陳 on 2023/8/4.
//

import Foundation


class MockAPIClientSuccess: APIClient {
    
    func performRequest(apiRequest: APIRequest, completion: @escaping ((Result<Data, Error>) -> Void)) {
        let json = """
        {
            "userId": 1,
            "id": 1,
            "title": "delectus aut autem",
            "body": "message"
        }
        """
        
        guard let data = json.data(using: .utf8) else { return }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: {
            completion(.success(data))
        })
    }

}

