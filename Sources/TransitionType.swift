//
//  TransitionType.swift
//  Navigation
//
//  Created by Alexey Novikov on 26/06/2017.
//  Copyright © 2017 Lazada Group. All rights reserved.
//

import UIKit


/**
    A Type representing transition object which answer "How can I open this module?"
 
    It should contain logic of how viewController is openning (push, present modaly, castom transition)
 */
public protocol TransitionType {
    func perform()
}

open  class PushTransition: TransitionType {
    
    public var source: UIViewController?
    public var destination: UIViewController?
    
    public init() { }
    
    open func perform() {
        destination.flatMap { source?.navigationController?.pushViewController($0, animated: true) }
    }
}

open class PopTransition: TransitionType {
    open func perform() {
        //TODO: implement
    }
}

public class ModalTransition: TransitionType {

    public var source: UIViewController?
    public var destination: UIViewController?
    
    var animated: Bool
    
    public init(source: UIViewController, destination: UIViewController, animated: Bool) {
        self.animated = animated
        self.source = source
        self.destination = destination
    }
    
    public func perform() {
        destination.flatMap { source?.present($0, animated: self.animated) }
    }
}

public class DismissTransition: TransitionType {
    open func perform() {
         //TODO: implement
    }
}

public class CustomTransition: TransitionType {
    
    public func perform() {
         //TODO: implement as example
    }
}


