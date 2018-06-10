//
//  CardListViewModel.swift
//  PRDemoApp
//
//  Created by Sam Watts on 10/06/2018.
//  Copyright © 2018 Sam Watts. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

final class CardListViewModel {

    private(set) var disposeBag = DisposeBag()

    let cards: BehaviorRelay<[Card]>

    let dataProvider: DataProvider = Current.dataProvider

    init(cards: [Card] = []) {
        self.cards = BehaviorRelay(value: cards)
    }

    func fetchCards() {

        dataProvider
            .fetchResponse(fromURL: .cardList)
            .convert(to: [Card].self)
            .catchErrorJustReturn([])
            .observeOn(MainScheduler.instance)
            .bind(to: cards)
            .disposed(by: disposeBag)
    }

    func cancel() {
        disposeBag = DisposeBag()
    }
}
