//
//  DataProvider+Stubs.swift
//  PRDemoAppTests
//
//  Created by Sam Watts on 10/06/2018.
//  Copyright © 2018 Sam Watts. All rights reserved.
//

import Foundation
@testable import PRDemoApp
import RxSwift
import RxCocoa

struct ErrorDataProvider: DataProvider {

    let error: Error = NSError(domain: #file, code: #line, userInfo: nil)

    func fetchResponse(fromURL url: URL) -> Observable<Data> {
        return Observable.error(error)
    }
}
