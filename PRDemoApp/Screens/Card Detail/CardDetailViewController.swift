//
//  CardDetailViewController.swift
//  PRDemoApp
//
//  Created by Sam Watts on 10/06/2018.
//  Copyright © 2018 Sam Watts. All rights reserved.
//

import UIKit

class CardDetailViewController: BaseViewController {

    let balanceLabel: UILabel = {
        let balanceLabel = UILabel()
        balanceLabel.translatesAutoresizingMaskIntoConstraints = false
        balanceLabel.textAlignment = .center
        return balanceLabel
    }()

    let viewModel: CardDetailViewModel

    override func loadView() {
        view = UIView()
        view.backgroundColor = .white

        view.addSubview(balanceLabel)

        NSLayoutConstraint.activate([
            balanceLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            balanceLabel.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor)
        ])
    }

    init(card: Card) {
        viewModel = CardDetailViewModel(card: card)

        super.init()

        title = card.name
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupBindings()
    }

    private func setupBindings() {

        viewModel
            .cardDetails
            .subscribe(onNext: { [weak self] cardDetails in
                self?.balanceLabel.text = cardDetails.balance
            })
            .disposed(by: disposeBag)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        viewModel.fetchCardDetails()
    }
}
