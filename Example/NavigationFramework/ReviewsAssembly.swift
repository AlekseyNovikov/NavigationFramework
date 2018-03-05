//
//  ReviewsAssembly.swift
//  Navigation
//
//  Created by Alexey Novikov on 30/06/2017.
//  Copyright © 2017 Lazada Group. All rights reserved.
//

import NavigationFramework
import Swinject

public class ReviewsAssembly: Assembly {
    
    public init () { }

    public func assemble(container: Container) {
        
        container.register(ModuleInputBuilder.self, name: "Reviews") { _ in
            return { try ReviewsModuleInput(dict: $0) }
        }
        
        container.register(ModuleInputBuilder.self, name: "mReviews") { _ in
            return { try ReviewsModuleInput(dict: $0) }
            }
        
//        container.register(TransitionType.self, name: "Reviews") { (r: Resolver, from: UIViewController, input: ModuleInputType) -> TransitionType in
//            let transition = ReviewsTransition()
//            transition.coordinator = r.resolve(TabBarCoordinatorType.self)
//            transition.source = from
//            transition.destination = container.resolve(UIViewController.self, name: "Reviews")
//            return transition
//        }
        
        container.registerTransition(to: "Reviews") { (from: UIViewController, input: ModuleInputType) -> TransitionType in
            let transition = ReviewsTransition()
            transition.coordinator = container.resolve(TabBarCoordinatorType.self)
            transition.source = from
            transition.destination = container.resolve(UIViewController.self, name: "Reviews")
            return transition

        }
        
        container.register(TransitionType.self, name: "mReviews") { (r: Resolver, from: UIViewController, input: ModuleInputType) -> TransitionType in
            let transition = ModalTransition(source: from, destination: container.resolve(UIViewController.self, name: "Reviews")!, animated: true)
////            transition.coordinator = r.resolve(TabBarCoordinatorType.self)
//            transition.source = from
//            transition.destination = container.resolve(UIViewController.self, name: "Reviews")
            return transition
        }
        
        container.register(UIViewController.self, name: "Reviews") { (r: Resolver) -> UIViewController in
            
            let reviews = ReviewsViewController(nibName: "ReviewsViewController", bundle: Bundle(for: ReviewsAssembly.self))

            ///3. confuigure TODO: add input parameter???
//            let vm = r.resolve(ReviewsViewModel.self, name:"Reviews", argument: input)
//            reviews.viewModel = vm
//            
            return reviews
        }
        
        
        
        container.register(ReviewsViewModel.self, name: "Reviews") { (r: Resolver, input: ReviewsModuleInputType) -> ReviewsViewModel in
            return ReviewsViewModel(input: input)
        }
        
   
        container.register(TransitionType.self, name: "dReviews") { (r: Resolver) -> TransitionType in
            let coordinator = r.resolve(TabBarCoordinatorType.self)
            let transition = ReviewsDeeplinkTransition()
            transition.tabBarCoordinator = coordinator
            transition.destination = r.resolve(UIViewController.self, name: "Reviews") as? ReviewsViewController
            return ReviewsDeeplinkTransition()
        }
    }

}


