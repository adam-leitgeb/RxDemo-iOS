//
//  AppCoordinator.swift
//  BlankProject-iOS
//
//  Created by Adam Leitgeb on 01/02/2019.
//  Copyright (c) 2019 Adam Leitgeb. All rights reserved.
//

import AKit

final class AppCoordinator {

    // MARK: - Properties

    let window: UIWindow

    private lazy var serviceHolder: ServiceHolder = {
        let serviceHolder = ServiceHolder()
        // TODO: - Add services to service holder's stack
        
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
        #if DEBUG
        // TODO: - Debug code
        #else
        // TODO: - Production code
        #endif
    }

    // MARK: - Navigation

    // TODO: - Add navigation methods
}
