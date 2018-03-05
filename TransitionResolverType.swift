//
//  ResolvingTransitionType.swift
//  Navigation
//
//  Created by Alexey Novikov on 05/03/2018.
//  Copyright © 2018 Lazada Group. All rights reserved.
//

import Foundation
import UIKit

public protocol TransitionResolverType {
    
    func resolveTransition(to uri: String, from: UIViewController, params: [String: Any]) throws -> TransitionType?
    func resolveTransition(to uri: String, params: [String: Any]) throws -> TransitionType?
    
}


