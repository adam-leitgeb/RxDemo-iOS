//
//  HomeViewController.swift
//
//  Created by Adam Leitgeb on 10/02/2019.
//  Copyright (c) 2019 Adam Leitgeb. All rights reserved.
//

import UIKit

protocol HomeViewControllerInput: class {
    func setFetchButton(isLoading: Bool)
    func updateTimesFetchedValue(_ value: Int)
    func updateResponseCodeValue(_ value: String)
}

final class HomeViewController: UIViewController {

    // MARK: - Outlets

    @IBOutlet private weak var numberOfFetchesLabel: UILabel!
    @IBOutlet private weak var responseCodeLabel: UILabel!
    @IBOutlet private weak var fetchContentButton: LoadingButton!

    // MARK: - Properties

    weak var coordinator: HomeCoordinator?
    var viewModel: HomeViewModel!

    private var responseLabelPrefix: String {
        return NSLocalizedString("home.response-prefix", comment: "Response Code:\n")
    }

    // MARK: - View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigationBar()
        setupStrings()
        viewModel.viewDidLoad()
    }

    // MARK: - Setup

    func setupNavigationBar() {
        navigationController?.setNavigationBarHidden(true, animated: false)
    }

    func setupStrings() {
        responseCodeLabel.text = responseLabelPrefix
    }

    // MARK: - Actions

    @IBAction func fetchContentButtonTapped(_ sender: LoadingButton) {
        viewModel.fetchContentButtonTapped()
    }
}

extension HomeViewController: HomeViewControllerInput {
    func setFetchButton(isLoading: Bool) {
        if isLoading {
            fetchContentButton.startLoading()
        } else {
            fetchContentButton.stopLoading()
        }
    }

    func updateTimesFetchedValue(_ value: Int) {
        numberOfFetchesLabel.text = NSLocalizedString("home.counter-prefix", comment: "Times Fetched: ") + String(value)
    }

    func updateResponseCodeValue(_ value: String) {
        responseCodeLabel.text = responseLabelPrefix + value
    }
}
