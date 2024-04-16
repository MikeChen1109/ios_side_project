//
//  APIRequest.swift
//  TodoListApp
//
//  Created by 逸唐陳 on 2023/8/4.
//

import Foundation

enum APIRequestError: Error {
    case invalidURL
    case requestFailed
}

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
}

enum HttpPath: String {
    case post = "https://jsonplaceholder.typicode.com/posts/1"
}

protocol APIRequest {
    var method: HTTPMethod { get set }
    var path: HttpPath { get set }
    var queryItems: [URLQueryItem]? { get set }
    var headers: [String : String]? { get set }
    
    func makeRequest() throws -> URLRequest
}

struct APIRequestImpl: APIRequest {
    var method: HTTPMethod
    var path: HttpPath
    var queryItems: [URLQueryItem]?
    var headers: [String : String]?
    
    func makeRequest() throws -> URLRequest {
        guard var components = URLComponents(string: path.rawValue) else { throw APIRequestError.requestFailed }
        components.queryItems = queryItems
        guard let url = components.url else { throw APIRequestError.invalidURL }
        var request = URLRequest(url: url)
        request.timeoutInterval = 10
        request.httpMethod = method.rawValue
        request.allHTTPHeaderFields = headers
        return request
    }
}


