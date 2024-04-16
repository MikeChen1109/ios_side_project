//
//  AppCoordinator.swift
//  TodoListApp
//
//  Created by 逸唐陳 on 2023/8/6.
//

import UIKit

class AppCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    private let moduleFactory = ModuleFactory()
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        showHomeModule()
    }
    
    func showHomeModule() {
        let vc = moduleFactory.makeHomeModule()
        vc.appCoordinator = self
        navigationController.pushViewController(vc, animated: false)
    }
    
    func showDetailModule(post: Post) {
        let vc = moduleFactory.makeDetailModule(post: post)
        navigationController.pushViewController(vc, animated: true)
    }
    
    func showTodoListModule() {
        let TodoListCoordinator = CoordinatorFactory().makeTodoCoordinator(navigationController: navigationController)
        TodoListCoordinator.parentCoordinator = self
        childCoordinators.append(TodoListCoordinator)
        TodoListCoordinator.start()
    }
}
