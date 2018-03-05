//
//  PDPRouter.swift
//  PDP
//
//  Created by Alexey Novikov on 31/08/2017.
//  Copyright © 2017 Lazada Group. All rights reserved.
//

import UIKit
import Swinject
import NavigationFramework

class PDPRouter{
    var container: Container!
    var sourceViewConroller: UIViewController!
    
    func goToReviews(withPaparams params: [String:Any]) {
        let toUri = "mReviews"
        
        let transition = try! container.resolveTransition(to: toUri, from: sourceViewConroller, params: params)
        
        transition?.perform()
    }
}
