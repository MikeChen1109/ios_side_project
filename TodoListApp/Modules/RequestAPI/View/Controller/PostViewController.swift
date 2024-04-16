//
//  PostViewController.swift
//  TodoListApp
//
//  Created by 逸唐陳 on 2023/8/3.
//

import UIKit

class PostViewController: UIViewController {
    
    private let postTextView: UITextView = {
        let view = UITextView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isEditable = false
        view.accessibilityIdentifier = "postTextView"
        return view
    }()
    
    let viewModel: PostViewModel
    
    init(postViewModel: PostViewModel) {
        self.viewModel = postViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        view.addSubview(postTextView)
        postTextView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        postTextView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        postTextView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        postTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        binding()
        viewModel.getPost()
    }
    
    private func binding() {
        viewModel.postHandler = postHandler
    }

    private func postHandler(message: String) {
        postTextView.text = message
    }
}


