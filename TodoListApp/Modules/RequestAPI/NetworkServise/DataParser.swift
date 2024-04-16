//
//  DataParser.swift
//  TodoListApp
//
//  Created by 逸唐陳 on 2023/8/3.
//

import Foundation

protocol DataParser {
    func parse<T: Decodable>(type: T.Type, data: Data) throws -> T
}

enum ParserError: Error {
    case decodingError(underlyingError: Error)
}

class JSONDataParser: DataParser {
    func parse<T: Decodable>(type: T.Type, data: Data) throws -> T {
        do {
            let model = try JSONDecoder().decode(type.self, from: data)
            return model
        } catch let error {
            throw ParserError.decodingError(underlyingError: error)
        }
    }
}





