//
//  TabBarCoordinatorAssembly.swift
//  Navigation
//
//  Created by Alexey Novikov on 19/07/2017.
//  Copyright © 2017 Lazada Group. All rights reserved.
//

import Foundation
import NavigationFramework
import Swinject

/**
 Class providing acces to TabBarCoordinator
 
 TabBarCoordinator registered as singleton object
 */
final class TabBarCoordinatorAssembly: Assembly {
    ///register TabBarCoordinator in global DI container as singleton
    func assemble(container: Container) {
        container.register(TabBarCoordinatorType.self) { (r: Resolver) -> TabBarCoordinatorType in
            TabBarCoordinator()
        }.inObjectScope(.container)
    }
}

