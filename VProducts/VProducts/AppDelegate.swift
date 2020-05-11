//
//  AppDelegate.swift
//  VProducts
//
//  Created by Andrii Ilnitskyi on 01.04.2020.
//  Copyright © 2020 Andrii Ilnitskyi. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        start()
        
        return true
    }
    
    func start() {
        window = UIWindow(frame: UIScreen.main.bounds)
        let navControoler = UINavigationController()
        let vc = ProductListRouter.createModule(navigationController: navControoler)
        navControoler.viewControllers = [vc]
        window?.rootViewController = navControoler
        window?.makeKeyAndVisible()
    }
}

