//
//  GeneralStateService.swift
//  BlankProject-iOS
//
//  Created by Adam Leitgeb on 01/02/2019.
//  Copyright (c) 2019 Adam Leitgeb. All rights reserved.
//

import BoilerplateKit

protocol GeneralStateService: Service {
    var numberOfLaunches: Int { get set }
}

final class ProductionGeneralStateService {

    // MARK: - Properties

    private let defaults: UserDefaults = .standard

    // Constants

    enum UserDefaultsKeys {
        static let numberOfLaunches: String = "UserDefaultsKeys.numberOfLaunches"
    }
}

extension ProductionGeneralStateService: GeneralStateService {
    var numberOfLaunches: Int {
        get {
            return defaults.integer(forKey: UserDefaultsKeys.numberOfLaunches)
        }
        set {
            defaults.set(newValue, forKey: UserDefaultsKeys.numberOfLaunches)
        }
    }
}
