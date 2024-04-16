//
//  CoordinatorFactory.swift
//  TodoListApp
//
//  Created by 逸唐陳 on 2023/8/6.
//

import UIKit

class CoordinatorFactory {
    func makeAppCoordinator(navigationController: UINavigationController) -> AppCoordinator {
        let coordinator = AppCoordinator(navigationController: navigationController)
        return coordinator
    }
    
    func makeTodoCoordinator(navigationController: UINavigationController) -> TodoListCoordinator {
        let coordinator = TodoListCoordinator(navigationController: navigationController)
        return coordinator
    }
}
