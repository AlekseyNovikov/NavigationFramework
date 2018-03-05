//
//  DeepLinkHandler.swift
//  NavigationDemo
//
//  Created by Alexey Novikov on 07/07/2017.
//  Copyright © 2017 Lazada Group. All rights reserved.
//

import Foundation
import Swinject
import NavigationFramework


protocol DeepLinkHandlerType {
    func handleURl(_ url: URL)
}

class DeepLinkHandler: DeepLinkHandlerType  {
  
    var router: DeeplinkRouterType!

    
    func handleURl(_ url: URL) {
        ///map old deeplinks to new format
        ///or implement additional logic here
        /// handle universal links
        router.open(url: url)
    }

}
