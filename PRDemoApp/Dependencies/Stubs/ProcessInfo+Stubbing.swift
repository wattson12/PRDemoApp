//
//  ProcessInfo+Stubbing.swift
//  PRDemoApp
//
//  Created by Sam Watts on 10/06/2018.
//  Copyright © 2018 Sam Watts. All rights reserved.
//

import Foundation

extension ProcessInfo {

    private enum Arguments: String {
        case stubDataProvider
    }

    var shouldStubDataProvider: Bool {
        return self.arguments.contains(Arguments.stubDataProvider.rawValue)
    }
}
