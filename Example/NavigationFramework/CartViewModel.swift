//
//  CartViewModel.swift
//  Cart
//
//  Created by Alexey Novikov on 10/07/2017.
//  Copyright © 2017 Lazada Group. All rights reserved.
//

import Foundation

protocol CartViewModelType {
    var cartData: String { get }
}

class CartViewModel: CartViewModelType {
    
    var cartData: String = "Cart"
    
    let pdpParams = ["sku" : "efg456",
                     "from" : "cart",
                     "click_url" : "url://"]
    
    let reviewsParams = ["product" : "Product name",
                         "from" : "cart"]
    
    let modalReviewsParams = ["product" : "Product name",
                              "from" : "cart"]
}
