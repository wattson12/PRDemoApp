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
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        tableView.tableFooterView = UIView()
        return tableView
    }()

    let viewModel = CardListViewModel()

    override init() {
        super.init()

        self.title = "Card List"
    }

    override func loadView() {
        self.view = tableView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupBindings()
    }

    private func setupBindings() {

        viewModel
            .cards
            .bind(to: tableView.rx.items(cellIdentifier: "UITableViewCell")) { (_, card: Card, cell: UITableViewCell) in
                cell.textLabel?.text = card.name
                cell.accessoryType = .disclosureIndicator
            }
            .disposed(by: disposeBag)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        viewModel.fetchCards()
    }

}
