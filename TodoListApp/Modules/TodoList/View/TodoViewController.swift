//
//  TodoViewController.swift
//  TodoListApp
//
//  Created by 逸唐陳 on 2023/8/7.
//

import UIKit

class TodoViewController: UIViewController {
    weak var coordinator: TodoListCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        let todoList = TodoDataSource.shared.getAllTodo()
        print(todoList.count)
        for todo in todoList {
            try? TodoDataSource.shared.delete(todo)
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        coordinator?.didFinished()
    }
}

