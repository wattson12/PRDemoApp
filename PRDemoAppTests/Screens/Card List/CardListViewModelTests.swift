//
//  CardListViewModelTests.swift
//  PRDemoAppTests
//
//  Created by Sam Watts on 10/06/2018.
//  Copyright © 2018 Sam Watts. All rights reserved.
//

import XCTest
@testable import PRDemoApp
import RxSwift
import RxCocoa

class CardListViewModelTests: XCTestCase {
    
    var disposeBag: DisposeBag!

    override func setUp() {
        super.setUp()

        disposeBag = DisposeBag()
    }

    func testInitialCardArrayIsSetInObservableValue() {

        let cards: [Card] = [
            Card(identifier: 1, name: "first name"),
            Card(identifier: 2, name: "second name")
        ]
        let viewModel = CardListViewModel(cards: cards)

        XCTAssertEqual(viewModel.cards.value.map { $0.identifier }, cards.map { $0.identifier })
    }

    func testViewModelBindsDataProviderResponseToCards() {

        Current.dataProvider = StubDataProvider(data: testData(fromFixtureNamed: "card_list"))
        let viewModel = CardListViewModel()

        let viewModelComplete = expectation(description: "view model fetch complete")
        viewModel
            .cards
            .skip(1) //ignore the initial value
            .subscribe(onNext: { cards in
                XCTAssertEqual(cards.count, 2)
                viewModelComplete.fulfill()
            })
            .disposed(by: disposeBag)

        viewModel.fetchCards()

        waitForExpectations(timeout: 0.1)
    }

    func testViewModelConvertsFailedResponsesToEmptyArrayBeforeBinding() {

        Current.dataProvider = ErrorDataProvider()
        let viewModel = CardListViewModel()

        let viewModelComplete = expectation(description: "view model fetch complete")
        viewModel
            .cards
            .skip(1) //ignore the initial value
            .subscribe(onNext: { cards in
                XCTAssertTrue(cards.isEmpty)
                viewModelComplete.fulfill()
            })
            .disposed(by: disposeBag)

        viewModel.fetchCards()

        waitForExpectations(timeout: 0.1)
    }
    
}
