//
//  UITabBarExtension.swift
//  Navigation
//
//  Created by Alexey Novikov on 28/06/2017.
//  Copyright © 2017 Lazada Group. All rights reserved.
//
import UIKit

extension UITabBarController {
    func add(viewController: UIViewController, tabBarItem: UITabBarItem){
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.tabBarItem = tabBarItem
        if viewControllers == nil {
            viewControllers = [navigationController]
        } else {
            viewControllers?.append(navigationController)
        }
    }
    
    func select(viewController: UIViewController?) {
        selectedViewController = viewController?.navigationController
    }

}
