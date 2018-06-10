//
//  URL+CreationTests.swift
//  PRDemoAppTests
//
//  Created by Sam Watts on 10/06/2018.
//  Copyright © 2018 Sam Watts. All rights reserved.
//

import XCTest
@testable import PRDemoApp

class URL_CreationTests: XCTestCase {
    
    func testCreatingCardListURL() {
        let url = URL.cardList
        XCTAssertEqual(url.absoluteString, "https://api.jsonbin.io/b/5b")
    }
    
}
