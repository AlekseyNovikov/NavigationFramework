//
//  DeeplinkRouter.swift
//  NavigationDemo
//
//  Created by Alexey Novikov on 17/07/2017.
//  Copyright © 2017 Lazada Group. All rights reserved.
//

import Foundation
import NavigationFramework
import Swinject

extension URL {
    
     func parseLink() -> (String?, [String : String]){//TODO: remove parameter. or macke it class method
        let toUri = self.pathComponents.last
        
        
        var queryStrings = [String: String]()
        if let query = self.query {
            for qs in query.components(separatedBy: "&") {
                // Get the parameter name
                let key = qs.components(separatedBy: "=")[0]
                // Get the parameter value
                var value = qs.components(separatedBy: "=")[1]
                value = value.replacingOccurrences(of: "+", with: " ")
                value = value.removingPercentEncoding!
                
                queryStrings[key] = value
            }
        }
        
        return (toUri, queryStrings)
    }
    
}

protocol DeeplinkRouterType {
    func open(url: URL)
}


class DeepLinkRouter: DeeplinkRouterType {

    var container: Container!
    
    func open(url: URL) {
        
        let (path, inputDict) = url.parseLink()
        
        guard let toUri = path else { return }
        
        let transition = try? container.resolveTransition(to: toUri, params: inputDict)
        
        transition??.perform()        
    }
}
