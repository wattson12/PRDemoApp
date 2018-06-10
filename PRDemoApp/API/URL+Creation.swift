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
        guard let url = URL(string: "https://api.jsonbin.io/b/5b1cf783c2e3344ccd96d39d") else { fatalError("Unable to create URL for card list") }
        return url
    }

    static func cardDetail(forCard card: Card) -> URL {
        guard let url = URL(string: "https://api.jsonbin.io/b/5b1d04517a973f4ce5785995") else { fatalError("Unable to create URL for card detail") }
        return url
    }
}
