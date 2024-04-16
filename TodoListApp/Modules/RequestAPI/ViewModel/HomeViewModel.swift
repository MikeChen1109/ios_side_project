//
//  HomeViewModel.swift
//  TodoListApp
//
//  Created by 逸唐陳 on 2023/8/3.
//

import Foundation

class HomeViewModel {
    var eventState: ((EventState<Post>) -> Void)?
    
    private let postRepository: PostRepository
    
    init(postRepository: PostRepository = PostRepositoryImpl()) {
        self.postRepository = postRepository
    }
    
    func getPost() {
        eventState?(.loading)
        postRepository.getPost { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let post):
                DispatchQueue.main.async {
                    self.eventState?(.data(post))
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self.eventState?(.error(error))
                }
            }
        }
    }
    
}
