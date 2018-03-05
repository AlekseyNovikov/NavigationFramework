//
//  CartAssembly.swift
//  Navigation
//
//  Created by Alexey Novikov on 29/06/2017.
//  Copyright © 2017 Lazada Group. All rights reserved.
//

import Foundation
import Swinject
import NavigationFramework


public class CartAssembly: Assembly {
    
    public init() { }
    
    public func assemble(container: Container) {
        
        container.register(TransitionType.self, name: "Cart") { (r: Resolver) -> TransitionType in
            let coordinator = r.resolve(TabBarCoordinatorType.self)
            let transition = CartTransition()
            transition.coordiantor = coordinator
            return transition
        }

        container.register(UIViewController.self, name: "Cart") { (r: Resolver) -> UIViewController in

            let cart = CartViewController(nibName: "CartViewController", bundle:Bundle(for: CartAssembly.self))
            
            cart.viewModel = CartViewModel()
            let router = CartRouter()
            router.container = container
            cart.router = router

            return cart

            }
        
    }
}
