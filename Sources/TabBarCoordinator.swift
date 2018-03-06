//
//  TabBarCoordinator.swift
//  Navigation
//
//  Created by Alexey Novikov on 15/06/2017.
//  Copyright © 2017 Lazada Group. All rights reserved.
//

import UIKit

/// A Type that provide interface for root TabBar navigation
public protocol TabBarCoordinatorType: class {
    ///Required Root tabBarController
    var tabBarController: UITabBarController! { get set }
    /**
     Adds ViewController to TabBar
     
     NavigationController with `viewController` as rootViewController will be added to TabBar;
     - Parameter viewController: ViewController to add
     - Parameter name: name of new tab; will be used to access it later
     */
    func addTab(viewController: UIViewController, name: String)
    
    /**
     Get tab with name in TabBar
     
     - Parameter name: name of tab
     
     - Returns: viewController extracted from navigtaionController from tab with `name` or nil
     */
    func getTab(name: String) -> UIViewController?
    
    /**
     Select tab with name in TabBar
     
     - Parameter name: name of tab to select
     
     - Returns: viewController extracted from navigtaionController from tab with `name`
     */
    func selectTab(name: String) -> UIViewController//TODO: add check on existence
    
    /// NavigationController from currently selected tab
    var activeTabNavigationController: UINavigationController { get }
    
    /// Current top ViewController
    var topMostViewController: UIViewController { get }
}

/**
    Final class for managing root TabBar navigation
 
    Instance of this class will be created in Application layer and injected to vertical modules
 */
public final class TabBarCoordinator: TabBarCoordinatorType {
    
    public init () { }

    private var viewControllers : [String: UIViewController] = [:]
    
    ///Root tabBarController
    public var tabBarController: UITabBarController!

    /**
     Adds ViewController to TabBar
     
     NavigationController with `viewController` as rootViewController will be added to TabBar;
     - Parameter viewController: ViewController to add
     - Parameter name: name of new tab; will be used to access it later
     */
    public func addTab(viewController:UIViewController, name: String) {//TODO: configure TabBarItem outside
        tabBarController.add(viewController: viewController, tabBarItem: UITabBarItem(title: name, image: nil, selectedImage: nil))
        viewControllers[name] = viewController
    }
    
    /**
     Get tab with name in TabBar
     
     - Parameter name: name of tab
     
     - Returns: viewController extracted from navigtaionController from tab with `name` or nil
     */
    public func getTab(name: String) -> UIViewController? {
        return viewControllers[name]
    }
    
    /**
     Select tab with name in TabBar
     
     - Parameter name: name of tab to select
     
     - Returns: viewController extracted from navigtaionController from tab with `name`
     */
    public func selectTab(name: String) -> UIViewController {
        tabBarController.select(viewController: viewControllers[name])
        return activeTabNavigationController.viewControllers.first!
    }
    
    /// NavigationController from currently selected tab
    public var activeTabNavigationController: UINavigationController {
        return tabBarController.selectedViewController as! UINavigationController
        
    }
    
    /// Current top ViewController
    public var topMostViewController: UIViewController {
        return activeTabNavigationController.topViewController!
    }
    
}

