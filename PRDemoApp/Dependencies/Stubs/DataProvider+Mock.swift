//
//  DataProvider+Mock.swift
//  PRDemoApp
//
//  Created by Sam Watts on 10/06/2018.
//  Copyright © 2018 Sam Watts. All rights reserved.
//

import Foundation
import RxSwift

struct StubProvider: DataProvider {

    func fetchResponse(fromURL url: URL) -> Observable<Data> {
        if url == URL.cardList {
            return fetchCardList()
        } else if url == URL.cardDetail(forCard: Card(identifier: 1, name: "")) {
            return fetchCardDetails()
        } else {
            fatalError()
        }
    }

    private func returnContent<T: Codable>(_ value: T) -> Observable<Data> {
        do {
            let data = try JSONEncoder().encode(value)
            return .just(data)
        } catch {
            return .error(error)
        }
    }

    private func fetchCardList() -> Observable<Data> {
        let values: [Card] = [
            Card(identifier: 1, name: "first card"),
            Card(identifier: 2, name: "another card"),
            Card(identifier: 3, name: "last card")
        ]

        return returnContent(values)
    }

    private func fetchCardDetails() -> Observable<Data> {
        let cardDetails = CardDetail(identifier: 1, name: "detail name", balance: "$500")
        return returnContent(cardDetails)
    }
}

struct StubDataProvider: DataProvider {

    let data: Data

    func fetchResponse(fromURL url: URL) -> Observable<Data> {
        return Observable.just(data)
    }
}

var mockDataProvider: StubProvider {
    return StubProvider()
}
