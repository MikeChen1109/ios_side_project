//
//  SceneDelegate.swift
//  TodoListApp
//
//  Created by 逸唐陳 on 2023/8/2.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var appCoordinator = CoordinatorFactory().makeAppCoordinator(navigationController: UINavigationController())

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: scene)
        window?.rootViewController = appCoordinator.navigationController
        appCoordinator.start()
        window?.makeKeyAndVisible()
    }
}

