//
//  PostViewModel.swift
//  TodoListApp
//
//  Created by 逸唐陳 on 2023/8/3.
//

import Foundation

class PostViewModel {
    
    private let post: Post
    var postHandler: ((String) -> Void)?
    
    init(post: Post) {
        self.post = post
    }
    
    func getPost() {
        postHandler?(post.body)
    }
    
}
