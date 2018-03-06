//
//  ModuleInputType.swift
//  Navigation
//
//  Created by Alexey Novikov on 19/07/2017.
//  Copyright © 2017 Lazada Group. All rights reserved.
//

import Foundation

public typealias ModuleInputBuilder = ([String: Any]) throws -> ModuleInputType

public protocol ModuleInputType {
    init(dict: [String: Any]) throws
}

public enum ModuleInputError: Error {
    case invalidInputParams(description: String)
}
