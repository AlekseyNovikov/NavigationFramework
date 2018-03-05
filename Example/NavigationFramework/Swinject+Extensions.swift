//
//  Swinject+Extensions.swift
//  NavigationFramework_Example
//
//  Created by Alexey Novikov on 05/03/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Foundation
import Swinject
import NavigationFramework

extension Container: TransitionResolverType {
    
    public func resolveTransition(to uri: String,
                                  from: UIViewController,
                                  params: [String: Any]) throws -> TransitionType?  {
        let closure = resolve(ModuleInputBuilder.self, name: uri)!
        let input = try closure(params)
        return resolve(TransitionType.self, name: uri, arguments: from, input)
    }
    
    public func resolveTransition(to uri: String,
                                  params: [String: Any]) throws -> TransitionType? {
        let closure = resolve(ModuleInputBuilder.self, name: uri)!
        let input = try closure(params)
        return resolve(TransitionType.self, name: uri, argument: input)
    }
}

extension Container: TransitionContainerType {
    public  func registerTransition(to uri: String, factory: @escaping (UIViewController, ModuleInputType) -> TransitionType) {
        self.register(TransitionType.self, name: uri) { (r: Resolver, fromVC: UIViewController, moduleInput: ModuleInputType) -> TransitionType in
            factory(fromVC, moduleInput)
        }
    }
}
