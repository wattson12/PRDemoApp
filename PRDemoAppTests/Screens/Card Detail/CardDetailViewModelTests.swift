//
//  CardDetailViewModelTests.swift
//  PRDemoAppTests
//
//  Created by Sam Watts on 10/06/2018.
//  Copyright © 2018 Sam Watts. All rights reserved.
//

import XCTest
@testable import PRDemoApp
import RxSwift
import RxCocoa

class CardDetailViewModelTests: XCTestCase {
    
    var disposeBag: DisposeBag!

    override func setUp() {
        super.setUp()

        disposeBag = DisposeBag()
    }

    func testViewModelBindsDataProviderResponseToCardDetails() {

        Current.dataProvider = StubDataProvider(data: testData(fromFixtureNamed: "card_details"))
        let viewModel = CardDetailViewModel(card: Card(identifier: 1, name: "name"))

        let viewModelComplete = expectation(description: "view model fetch complete")
        viewModel
            .cardDetails
            .subscribe(onNext: { cardDetails in
                XCTAssertEqual(cardDetails.balance, "£999")
                viewModelComplete.fulfill()
            })
            .disposed(by: disposeBag)

        viewModel.fetchCardDetails()

        waitForExpectations(timeout: 0.1)
    }

    func testViewModelPassesErrorsThroughBinding() {

        Current.dataProvider = ErrorDataProvider()
        let viewModel = CardDetailViewModel(card: Card(identifier: 1, name: "name"))

        let viewModelComplete = expectation(description: "view model fetch complete")
        viewModel
            .cardDetails
            .subscribe(onNext: { _ in
                XCTFail()
                viewModelComplete.fulfill()
            }, onError: { _ in
                viewModelComplete.fulfill()
            })
            .disposed(by: disposeBag)

        viewModel.fetchCardDetails()

        waitForExpectations(timeout: 0.1)
    }
    
}
