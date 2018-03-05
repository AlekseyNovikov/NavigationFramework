//
//  ReviewsTransition.swift
//  Navigation
//
//  Created by Alexey Novikov on 28/06/2017.
//  Copyright © 2017 Lazada Group. All rights reserved.
//

import UIKit
import NavigationFramework

class ReviewsTransition:  PushTransition {
    
    public var coordinator: TabBarCoordinatorType?

    
    override func perform() {
        _ = coordinator?.selectTab(name: "PDP")
        if let navigationController = coordinator?.activeTabNavigationController {
            destination.flatMap { navigationController.pushViewController($0, animated: true) }
            
        }
    }
    
    
}


class ReviewsDeeplinkTransition: TransitionType {
    
    var destination: ReviewsViewController?
    var tabBarCoordinator: TabBarCoordinatorType?
    
    func perform() {
        ///1. select right tab
        _ = tabBarCoordinator?.selectTab(name: "PDP")
        if let navigationController = tabBarCoordinator?.activeTabNavigationController {
            destination.flatMap { navigationController.pushViewController($0, animated: true)
            }
        }
        
    }
}
