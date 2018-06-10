//
//  PRDemoAppUITests.swift
//  PRDemoAppUITests
//
//  Created by Sam Watts on 10/06/2018.
//  Copyright © 2018 Sam Watts. All rights reserved.
//

import XCTest

class PRDemoAppUITests: XCTestCase {

    var app: XCUIApplication!
        
    override func setUp() {
        super.setUp()
        
        app = XCUIApplication()

        app.launchArguments.append("stubDataProvider")
        continueAfterFailure = false
        app.launch()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testCardListTitle() {

        XCTAssert(app.navigationBars["Card List"].exists)
    }

    func testCardListContents() {

        XCTAssertEqual(app.tables.cells.count, 3)

        XCTAssertTrue(app.tables.cells.staticTexts["first card"].exists)
        XCTAssertTrue(app.tables.cells.staticTexts["another card"].exists)
        XCTAssertTrue(app.tables.cells.staticTexts["last card"].exists)
    }
    
}
