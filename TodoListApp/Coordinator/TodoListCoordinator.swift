//
//  LoginCoordinator.swift
//  TodoListApp
//
//  Created by 逸唐陳 on 2023/8/6.
//

import UIKit

class TodoListCoordinator: Coordinator {
    weak var parentCoordinator: Coordinator?
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    private let moduleFactory = ModuleFactory()
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        showTodoModule()
    }
    
    func showTodoModule() {
        let vc = moduleFactory.makeTodoModule()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func didFinished() {
        parentCoordinator?.childDidFinish(self)
    }
}

