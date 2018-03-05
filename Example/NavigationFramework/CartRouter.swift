//
//  CartRouter.swift
//  Navigation
//
//  Created by Alexey Novikov on 16/06/2017.
//  Copyright © 2017 Lazada Group. All rights reserved.
//

import UIKit
import Swinject
import NavigationFramework

class CartRouter {
    
    var container: Container!
    var sourceViewConroller: UIViewController!
    
    func goToPDP(withParams params: [String:Any]) {
        ///1. generate uri for pdp view controller
        let toUri = "PDP"
        
        ///2. try resolve transition by destination uri with input params
        let transition = try! container.resolveTransition(to: toUri, from: sourceViewConroller, params: params)!
    
        ///3. perform transition
        transition.perform()
    }
    
    
    func goToReviews(withParams params: [String:Any]) {
        ///1. generate uri for reviews view controller
        let toUri = "Reviews"
        
        ///2. try resolve transition by destination uri with input params
        let transition = try! container.resolveTransition(to: toUri, from: sourceViewConroller, params: params)
    
        ///3. perform transition
        transition?.perform()
    }
    
    func goToModalReviews(withParams params: [String:Any]) {
        ///1. generate uri for modal reviews view controller
        let toUri = "mReviews"
        
        ///2. try resolve transition by destination uri with input params
        let transition = try! container.resolveTransition(to: toUri, from: sourceViewConroller, params: params)
        
        ///3. perform transition
        transition?.perform()
    }
}
