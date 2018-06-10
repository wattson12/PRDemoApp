//
//  Card.swift
//  PRDemoApp
//
//  Created by Sam Watts on 10/06/2018.
//  Copyright © 2018 Sam Watts. All rights reserved.
//

import Foundation

struct Card: Codable {
    private enum CodingKeys: CodingKey, String {
        case identifier = "id"
        case name
    }

    let identifier: Int
    let name: String
}

struct CardDetail: Codable {
    private enum CodingKeys: CodingKey, String {
        case identifier = "id"
        case name
        case balance
    }

    let identifier: Int
    let name: String
    let balance: String
}
