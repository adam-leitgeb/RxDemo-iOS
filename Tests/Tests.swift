//
//  Tests.swift
//  Tests
//
//  Created by Adam Leitgeb on 11/02/2019.
//  Copyright © 2019 Adam Leitgeb. All rights reserved.
//

import RxBlocking
import RxSwift
import XCTest

@testable import RxDemo

// swiftlint:disable force_try
class Tests: XCTestCase {

    // MARK: - Properties

    private var appCoordinator: AppCoordinator {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate, let appCoordinator = appDelegate.appCoordinator else {
            XCTFail("Unable to reach appCoordinator")
            fatalError("Unable to reach appCoordinator")
        }
        return appCoordinator
    }

    private let disposeBag = DisposeBag()

    // MARK: - Tests

    func testRequests() {
        let serviceHolder = appCoordinator.serviceHolder
        let homeService: HomeService = serviceHolder.get()
        let timesFetched = homeService.timesFetched.value

        _ = try! homeService.loadResponseCodeObservable().toBlocking().first()

        XCTAssert((timesFetched + 1) == homeService.timesFetched.value)
    }
}
