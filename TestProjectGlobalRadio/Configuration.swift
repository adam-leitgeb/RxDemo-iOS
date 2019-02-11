//
//  Configuration.swift
//  BlankProject-iOS
//
//  Created by Adam Leitgeb on 01/02/2019.
//  Copyright © 2019 Adam Leitgeb. All rights reserved.
//

import APIAdapter

extension Request {
    var token: String? {
        return nil
    }

    var authentication: Authentication {
        return .none
    }
}
