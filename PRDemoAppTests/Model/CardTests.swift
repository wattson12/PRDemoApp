//
//  CardTests.swift
//  PRDemoAppTests
//
//  Created by Sam Watts on 10/06/2018.
//  Copyright © 2018 Sam Watts. All rights reserved.
//

import XCTest
@testable import PRDemoApp

class CardTests: XCTestCase {
    
    func testMappingCard() {
        let data = testData(fromFixtureNamed: "card")
        do {
            let mappedCard = try JSONDecoder().decode(Card.self, from: data)
            XCTAssertEqual(mappedCard.identifier, 1)
            XCTAssertEqual(mappedCard.name, "card name")
        } catch {
            XCTFail("Unexpected mapping error: \(error)")
        }
    }
}
