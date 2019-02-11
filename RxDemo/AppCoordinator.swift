//
//  AppCoordinator.swift
//  BlankProject-iOS
//
//  Created by Adam Leitgeb on 01/02/2019.
//  Copyright (c) 2019 Adam Leitgeb. All rights reserved.
//

import APIAdapter
import BoilerplateKit

final class AppCoordinator {

    // MARK: - Properties

    let window: UIWindow

    lazy var serviceHolder: ServiceHolder = {
        let apiAdapter = APIAdapter()
        let serviceHolder = ServiceHolder()
        serviceHolder.add(HomeService.self) { ProductionHomeService(apiAdapter: apiAdapter) }

        return serviceHolder
    }()

    // MARK: - Init

    init() {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window.backgroundColor = .white
        self.window.makeKeyAndVisible()
    }

    // MARK: - Lifecycle

    func start() {
        showHome()
    }

    // MARK: - Navigation

    private func showHome() {
        let coordinator = HomeCoordinator(window: window, serviceHolder: serviceHolder)
        coordinator.start()
    }
}
