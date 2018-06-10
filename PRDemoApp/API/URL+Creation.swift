//
//  URL+Creation.swift
//  PRDemoApp
//
//  Created by Sam Watts on 10/06/2018.
//  Copyright © 2018 Sam Watts. All rights reserved.
//

import Foundation

extension URL {

    static var cardList: URL {
        guard let url = URL(string: "") else { fatalError("Unable to create URL for card list") }
        return url
    }
}
