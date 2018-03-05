//
//  AppDelegate.swift
//  NavigationFramework
//
//  Created by AlekseyNovikov on 03/05/2018.
//  Copyright (c) 2018 AlekseyNovikov. All rights reserved.
//

import UIKit
import Swinject
import NavigationFramework

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    let assembler = Assembler([
        TabBarCoordinatorAssembly(),
        CartAssembly(),
        PDPAssembly(),
        ReviewsAssembly(),
        DeepLinkAssembly()
        ])
    
    var window: UIWindow?
    var tabBarCoordinator: TabBarCoordinatorType?



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        let resolver = assembler.resolver

        let tabBarControoller = UITabBarController()
        tabBarCoordinator = resolver.resolve(TabBarCoordinatorType.self)
        
        
        tabBarCoordinator?.tabBarController = tabBarControoller
        window?.rootViewController = tabBarControoller
        
        
        if let cart = resolver.resolve(UIViewController.self, name: "Cart"){
            tabBarCoordinator?.addTab(viewController: cart, name: "Cart")
        }
        
        if let pdp = resolver.resolve(UIViewController.self, name: "PDP") {
            tabBarCoordinator?.addTab(viewController: pdp, name: "PDP")
        }
        
        
        
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

