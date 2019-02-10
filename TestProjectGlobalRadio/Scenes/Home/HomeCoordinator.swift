//
//  HomeCoordinator.swift
//  TestProjectGlobalRadio
//
//  Created by Adam Leitgeb on 10/02/2019.
//  Copyright (c) 2019 Adam Leitgeb. All rights reserved.
//

import BoilerplateKit
import APIAdapter

protocol HomeCoordinatorInput: CoordinatorInput {
}

final class HomeCoordinator: Coordinator {

    // MARK: - Properties

    private let window: UIWindow
    private let navigationController: UINavigationController
    let viewController: HomeViewController

    private let serviceHolder: ServiceHolder

    // MARK: - Initialization

    init(window: UIWindow, serviceHolder: ServiceHolder) {
        self.window = window
        viewController = HomeViewController.instantiateFromStoryboard()
        navigationController = UINavigationController(rootViewController: viewController)
        self.serviceHolder = serviceHolder
    }

    // MARK: - Actions

    func start() {
        configure(viewController: viewController)
        window.rootViewController = navigationController
    }

    func stop() {
    }

    // MARK: - Utilities

    func configure(viewController: HomeViewController) {
        viewController.coordinator = self
        viewController.viewModel = HomeViewModel(coordinator: self, viewController: viewController, homeService: serviceHolder.get())
    }
}

extension HomeCoordinator: HomeCoordinatorInput {
}
