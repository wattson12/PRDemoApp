//
//  Observable+ConversionTests.swift
//  PRDemoAppTests
//
//  Created by Sam Watts on 10/06/2018.
//  Copyright © 2018 Sam Watts. All rights reserved.
//

import XCTest
@testable import PRDemoApp
import RxSwift

class Observable_ConversionTests: XCTestCase {

    var disposeBag: DisposeBag!

    override func setUp() {
        super.setUp()

        disposeBag = DisposeBag()
    }

    func testMappingToDecodableType() {

        let data = testData(fromFixtureNamed: "card")

        let observableChainCompleted = expectation(description: "observable chain completed")

        Observable<Data>
            .just(data)
            .convert(to: Card.self)
            .subscribe { event in
                switch event {
                case .next(let card):
                    XCTAssertEqual(card.identifier, 1)
                    observableChainCompleted.fulfill()
                case .error(let error):
                    XCTFail("Unexpecetd error: \(error)")
                case .completed:
                    break
                }
            }
            .disposed(by: disposeBag)

        waitForExpectations(timeout: 0.1)
    }

    func testMappingViaKeypath() {

        struct DummyValue {
            let id: String
        }

        let value = DummyValue(id: "a")

        let observableChainCompleted = expectation(description: "observable chain completed")

        Observable
            .just(value)
            .mapToKeypath(\.id)
            .subscribe { event in
                switch event {
                case .next(let identifier):
                    XCTAssertEqual(identifier, "a")
                    observableChainCompleted.fulfill()
                case .error(let error):
                    XCTFail("Unexpecetd error: \(error)")
                case .completed:
                    break
                }
            }
            .disposed(by: disposeBag)

        waitForExpectations(timeout: 0.1)
    }

}
