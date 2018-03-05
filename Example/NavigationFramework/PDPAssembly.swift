//
//  PDPAssembly.swift
//  Navigation
//
//  Created by Alexey Novikov on 29/06/2017.
//  Copyright © 2017 Lazada Group. All rights reserved.
//

import Swinject
import NavigationFramework

public class PDPAssembly: Assembly {
    
    public init () { }
    
    public func assemble(container: Container) {
        ///Input factory
        container.register(ModuleInputBuilder.self, name: "PDP") { _ in
            return { try PDPModuleInput(dict: $0) }
        }
        
        ///Transition for in-app navigation
        container.register(TransitionType.self, name: "PDP") { (r: Resolver,  from: UIViewController, input: ModuleInputType) -> TransitionType in
            
            let transition = PDPTransition(tabBarCoordinator: r.resolve(TabBarCoordinatorType.self)!)//custom transition
            
            //as pdpVC is already created, we don't need to resolve new one. In this case we retrive existing viewcontroller from transtition.destination property...
            let pdpVC = transition.destination as? PDPViewController
           
            //...and configure it with new viewModel
            pdpVC?.viewModel = PDPViewModel(input: input as? PDPModuleInput)//r.resolve(PDPViewModel.self, argument: input)
            
            return transition
        }
        
        ///Configured with input View Controller factory
        container.register(UIViewController.self, name: "PDP") { (r: Resolver, input: ModuleInputType) -> UIViewController in
            
            let pdp = PDPViewController(nibName: "PDPViewController", bundle:Bundle(for: PDPAssembly.self))
            
            pdp.viewModel = PDPViewModel(input: input as? PDPModuleInput)
            let router = PDPRouter()
            router.container = container
            pdp.router = router
            
            return pdp
        }
        
        //Empty
        container.register(UIViewController.self, name: "PDP") { (r: Resolver) -> UIViewController in
            let pdp = PDPViewController(nibName: "PDPViewController", bundle:Bundle(for: PDPAssembly.self))
            let router = PDPRouter()
            router.container = container
            pdp.router = router
            pdp.viewModel = PDPViewModel(input: nil)
            return pdp
        }
                
        ///Transition for from deeplink navigation
        container.register(TransitionType.self, name: "dPDP") { (r: Resolver, input: ModuleInputType) -> TransitionType in
            let coordinator = r.resolve(TabBarCoordinatorType.self)
            let transition = PDPDeeplinkTransition()
            transition.tabBarCoordinator = coordinator
            return transition
        }
    }
}
