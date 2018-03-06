//
//  TransitionContainer.swift
//  Navigation
//
//  Created by Alexey Novikov on 05/03/2018.
//  Copyright © 2018 Lazada Group. All rights reserved.
//

import Foundation

public protocol TransitionContainerType {
    func registerTransition(to uri: String, factory: @escaping (UIViewController, ModuleInputType) -> TransitionType)
}
