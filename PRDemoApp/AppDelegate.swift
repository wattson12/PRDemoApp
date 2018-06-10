//
//  AppDelegate.swift
//  PRDemoApp
//
//  Created by Sam Watts on 10/06/2018.
//  Copyright © 2018 Sam Watts. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    private var appCoordinator: AppCoordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        appCoordinator = AppCoordinator()
        appCoordinator?.start()

        return true
    }

}
