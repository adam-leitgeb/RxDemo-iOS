//
//  HomeViewModel.swift
//  TestProjectGlobalRadio
//
//  Created by Adam Leitgeb on 10/02/2019.
//  Copyright (c) 2019 Adam Leitgeb. All rights reserved.
//

import Foundation

final class HomeViewModel {

    // MARK: - Properties

    private let coordinator: HomeCoordinatorInput
    private weak var viewController: HomeViewControllerInput?
    private let homeService: HomeService

    // MARK: - Initialization

    init(coordinator: HomeCoordinatorInput, viewController: HomeViewControllerInput, homeService: HomeService) {
        self.coordinator = coordinator
        self.viewController = viewController
        self.homeService = homeService
    }

    // MARK: - Actions

    func viewDidLoad() {
        loadData()
    }

    // MARK: - Utilities

    private func loadData() {
        // code..
    }
}
