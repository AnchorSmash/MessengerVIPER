//
//  AppDelegate.swift
//  MessengerVIPER
//
//  Created by ShadowMoon on 15/01/2019.
//  Copyright © 2019 Виктор Кулаков. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var app: Application?
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()
        app = Application()
        window?.rootViewController = app?.fire()
        window?.makeKeyAndVisible()
        return true
    }
    
}
