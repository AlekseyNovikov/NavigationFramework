//
//  PDPModuleInput.swift
//  PDP
//
//  Created by Alexey Novikov on 10/07/2017.
//  Copyright © 2017 Lazada Group. All rights reserved.
//

import Foundation
import NavigationFramework

protocol PDPModuleInputType {
    var simpleSku: String { get }
    var interfaceFrom : String { get }
    var clickUrl: String { get }
}

class PDPModuleInput : ModuleInputType{
    let  simpleSku: String
    let interfaceFrom : String
    let clickUrl: String
    
    required init(dict:[String : Any]) throws {
        guard let sku = dict["sku"] as? String else {
            throw ModuleInputError.invalidInputParams(description: "missed required param: \"sku\"")
        }
        guard let from = dict["from"] as? String  else {
            throw ModuleInputError.invalidInputParams(description: "missed required param:  \"from\"")
        }
        
        guard let clickUrl = dict["click_url"] as? String else {
            throw ModuleInputError.invalidInputParams(description: "missed required param: \"click_url\"")
        }
        
        self.simpleSku = sku
        self.interfaceFrom = from
        self.clickUrl = clickUrl
    }
}
