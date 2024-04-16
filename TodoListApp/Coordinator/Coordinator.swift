//
//  Coordinator.swift
//  TodoListApp
//
//  Created by 逸唐陳 on 2023/8/6.
//

import Foundation
import UIKit

protocol Coordinator: AnyObject {
    var navigationController: UINavigationController { get set }
    var childCoordinators: [Coordinator] { get set }
    
    func start()
}

extension Coordinator {
    func childDidFinish(_ coordinator : Coordinator){
        for (index, child) in childCoordinators.enumerated() {
            if child === coordinator {
                childCoordinators.remove(at: index)
                break
            }
        }
    }
}

