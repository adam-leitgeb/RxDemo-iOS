//
//  HomeService.swift
//  TestProjectGlobalRadio
//
//  Created by Adam Leitgeb on 10/02/2019.
//  Copyright (c) 2019 Adam Leitgeb. All rights reserved.
//

import BoilerplateKit
import APIAdapter

protocol HomeService: Service {
}

final class ProductionHomeService {

    // MARK: - Properties

    private let apiAdapter: APIAdapter

    // MARK: - Initialization

    init(apiAdapter: APIAdapter) {
        self.apiAdapter = apiAdapter
    }
}

extension ProductionHomeService: HomeService {
}
