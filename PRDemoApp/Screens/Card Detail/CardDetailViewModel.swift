//
//  CardDetailViewModel.swift
//  PRDemoApp
//
//  Created by Sam Watts on 10/06/2018.
//  Copyright © 2018 Sam Watts. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

final class CardDetailViewModel {

    private(set) var disposeBag = DisposeBag()

    let cardDetails = PublishSubject<CardDetail>()
    private let card: Card

    let dataProvider: DataProvider = Current.dataProvider

    init(card: Card) {
        self.card = card
    }

    func fetchCardDetails() {

        dataProvider
            .fetchResponse(fromURL: URL.cardDetail(forCard: card))
            .convert(to: CardDetail.self)
            .observeOn(MainScheduler.instance)
            .bind(to: cardDetails)
            .disposed(by: disposeBag)
    }

    func cancel() {
        disposeBag = DisposeBag()
    }
}
