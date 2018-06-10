//
//  CardDetailViewController.swift
//  PRDemoApp
//
//  Created by Sam Watts on 10/06/2018.
//  Copyright © 2018 Sam Watts. All rights reserved.
//

import UIKit

class CardDetailViewController: BaseViewController {

    init(card: Card) {
        super.init()

        title = card.name
    }
}