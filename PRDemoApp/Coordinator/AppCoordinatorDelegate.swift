//
//  AppCoordinatorDelegate.swift
//  PRDemoApp
//
//  Created by Sam Watts on 10/06/2018.
//  Copyright © 2018 Sam Watts. All rights reserved.
//

import UIKit

protocol AppCoordinatorDelegate: class {

    func cardSelected(_ card: Card, fromViewController: UIViewController)
}
