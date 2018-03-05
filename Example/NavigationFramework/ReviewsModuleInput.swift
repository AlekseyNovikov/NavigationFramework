//
//  ReviewsModuleInput.swift
//  Reviews
//
//  Created by Alexey Novikov on 11/07/2017.
//  Copyright © 2017 Lazada Group. All rights reserved.
//

import Foundation
import NavigationFramework

protocol ReviewsModuleInputType {
    var product: String { get }
    var interfaceFrom: String { get }
}

class ReviewsModuleInput:ModuleInputType, ReviewsModuleInputType {
    private(set) var interfaceFrom: String
    private(set) var product: String
    
    required init(dict:[String: Any]) throws {
        guard let product = dict["product"] as? String else {
            throw ModuleInputError.invalidInputParams(description: "missed required param: \"product\"")
        }
        guard let from = dict["from"] as? String  else {
            throw ModuleInputError.invalidInputParams(description: "missed required param:  \"from\"")
        }
        
        self.product = product
        self.interfaceFrom = from
    }

    
}
