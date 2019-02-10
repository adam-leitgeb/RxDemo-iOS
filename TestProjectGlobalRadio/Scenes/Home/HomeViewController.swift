//
//  HomeViewController.swift
//  TestProjectGlobalRadio
//
//  Created by Adam Leitgeb on 10/02/2019.
//  Copyright (c) 2019 Adam Leitgeb. All rights reserved.
//

import UIKit

protocol HomeViewControllerInput: class {
}

final class HomeViewController: UIViewController {

    // MARK: - Outlets

    @IBOutlet private weak var numberOfFetchesLabel: UILabel!
    @IBOutlet private weak var responseCodeLabel: UILabel!
    @IBOutlet private weak var fetchContentButton: UIButton!

    // MARK: - Properties

    weak var coordinator: HomeCoordinator?
    var viewModel: HomeViewModel!

    // MARK: - View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigationBar()
        viewModel.viewDidLoad()
    }

    // MARK: - Setup

    func setupNavigationBar() {
        navigationController?.setNavigationBarHidden(true, animated: false)
    }

    // MARK: - Actions

    @IBAction func fetchButtonTapped(_ sender: UIButton) {
    }
}

extension HomeViewController: HomeViewControllerInput {
}
