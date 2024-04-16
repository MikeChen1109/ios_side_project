//
//  ModuleFactory.swift
//  TodoListApp
//
//  Created by 逸唐陳 on 2023/8/6.
//

import Foundation

class ModuleFactory {
    func makeHomeModule() -> ViewController {
        ViewController()
    }
    
    func makeDetailModule(post: Post) -> PostViewController {
        let viewModel = PostViewModel(post: post)
        let vc = PostViewController(postViewModel: viewModel)
        return vc
    }
    
    func makeTodoModule() -> TodoViewController {
        TodoViewController()
    }
}
