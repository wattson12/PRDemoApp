//
//  Environment.swift
//  PRDemoApp
//
//  Created by Sam Watts on 10/06/2018.
//  Copyright © 2018 Sam Watts. All rights reserved.
//

import Foundation

struct Environment {
    var dataProvider: DataProvider = URLSession.shared
}

// swiftlint:disable identifier_name
var Current = Environment()
// swiftlint:enable identifier_name
