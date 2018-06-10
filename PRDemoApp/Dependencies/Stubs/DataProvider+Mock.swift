//
//  DataProvider+Mock.swift
//  PRDemoApp
//
//  Created by Sam Watts on 10/06/2018.
//  Copyright © 2018 Sam Watts. All rights reserved.
//

import Foundation
import RxSwift

struct StubProvider<T: Encodable>: DataProvider {

    let value: T

    func fetchResponse(fromURL url: URL) -> Observable<Data> {
        do {
            let data = try JSONEncoder().encode(value)
            return .just(data)
        } catch {
            return .error(error)
        }
    }
}

struct StubDataProvider: DataProvider {

    let data: Data

    func fetchResponse(fromURL url: URL) -> Observable<Data> {
        return Observable.just(data)
    }
}

var mockDataProvider: StubProvider<[Card]> {
    let values: [Card] = [
        Card(identifier: 1, name: "first card"),
        Card(identifier: 2, name: "another card"),
        Card(identifier: 3, name: "last card")
    ]
    return StubProvider(value: values)
}
