//
//  PDPTransition.swift
//  Navigation
//
//  Created by Alexey Novikov on 23/06/2017.
//  Copyright © 2017 Lazada Group. All rights reserved.
//

import Foundation
import UIKit
import NavigationFramework


public class PDPTransition:  TransitionType {
    
    let tabBarCoordinator: TabBarCoordinatorType
    lazy var destination = self.tabBarCoordinator.getTab(name: "PDP")

    public init(tabBarCoordinator:TabBarCoordinatorType) {
        self.tabBarCoordinator = tabBarCoordinator
    }
    
    public func perform() {
        _ = tabBarCoordinator.selectTab(name: "PDP")
    }
}

public class PDPDeeplinkTransition: TransitionType {
//    public func open(input: [String : Any]) throws {
//        let input = try PDPModuleInput(dict: input)
//        let pdp = tabBarCoordinator!.selectTab(name: "PDP") as! PDPViewController
//    }
    
    var tabBarCoordinator: TabBarCoordinatorType?

    
    public func perform() {
//        let input = try PDPModuleInput(dict: input)
        let pdp = tabBarCoordinator?.selectTab(name: "PDP") as! PDPViewController
    }
    
}

