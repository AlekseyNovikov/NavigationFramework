//
//  DeepLinkAssembly.swift
//  NavigationDemo
//
//  Created by Alexey Novikov on 07/07/2017.
//  Copyright © 2017 Lazada Group. All rights reserved.
//

import Foundation

import Swinject
import NavigationFramework


 class DeepLinkAssembly: Assembly {
    
    
    func assemble(container: Container) {
        
        container.register(DeepLinkHandlerType.self, name: "DeepLinkHandler") { (r: Resolver) -> DeepLinkHandlerType in
            
            let deepLinkHandler = DeepLinkHandler()
            deepLinkHandler.router = container.resolve(DeeplinkRouterType.self, name:"DeeplinkRouter")
            
            return deepLinkHandler
        }
        
        container.register(DeeplinkRouterType.self, name: "DeeplinkRouter") { (r: Resolver) -> DeeplinkRouterType in
            let deeplinkRouter = DeepLinkRouter()
            deeplinkRouter.container = container
            return deeplinkRouter
        }
    }
}
