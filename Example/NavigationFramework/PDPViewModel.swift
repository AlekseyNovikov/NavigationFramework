//
//  PDPViewModel.swift
//  PDP
//
//  Created by Alexey Novikov on 10/07/2017.
//  Copyright © 2017 Lazada Group. All rights reserved.
//

import Foundation

//protocol PDPViewModelType {
//    var input: PDPModuleInput { get }
//    
//}

class PDPViewModel {
    let pdpInput: PDPModuleInput?
    
    init(input: PDPModuleInput?) {
        self.pdpInput = input
    }
    
    let reviewsParams = ["product" : "Product name",
                         "from" : "cart"]
}
