//
//  CardListTableViewController.swift
//  PRDemoApp
//
//  Created by Sam Watts on 10/06/2018.
//  Copyright © 2018 Sam Watts. All rights reserved.
//

import UIKit

class CardListTableViewController: BaseViewController {

    let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        return tableView
    }()

    override init() {
        super.init()

        self.title = "Card List"
    }

    override func loadView() {
        self.view = tableView
    }

}
