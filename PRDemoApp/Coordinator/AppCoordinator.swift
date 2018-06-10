//
//  AppCoordinator.swift
//  PRDemoApp
//
//  Created by Sam Watts on 10/06/2018.
//  Copyright © 2018 Sam Watts. All rights reserved.
//

import UIKit

final class AppCoordinator {

    private let window: UIWindow

    init(window: UIWindow = UIWindow(frame: UIScreen.main.bounds)) {
        self.window = window
    }

    func start() {
        let cardListViewController = UIViewController()
        let rootNavigationController = UINavigationController(rootViewController: cardListViewController)

        window.rootViewController = rootNavigationController

        window.makeKeyAndVisible()
    }
}
