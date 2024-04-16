//
//  Post.swift
//  TodoListApp
//
//  Created by 逸唐陳 on 2023/8/2.
//

import Foundation

struct Post: Decodable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}
