//
//  HomeViewModel.swift
//  TestProjectGlobalRadio
//
//  Created by Adam Leitgeb on 10/02/2019.
//  Copyright (c) 2019 Adam Leitgeb. All rights reserved.
//

import Foundation
import RxSwift

final class HomeViewModel {

    // MARK: - Properties

    private let coordinator: HomeCoordinatorInput
    private weak var viewController: HomeViewControllerInput?
    private let homeService: HomeService

    private let disposeBag = DisposeBag()

    // MARK: - Initialization

    init(coordinator: HomeCoordinatorInput, viewController: HomeViewControllerInput, homeService: HomeService) {
        self.coordinator = coordinator
        self.viewController = viewController
        self.homeService = homeService
    }

    // MARK: - Actions

    func viewDidLoad() {
        viewController?.updateTimesFetchedValue(homeService.timesFetched.value)
    }

    func fetchContentButtonTapped() {
        viewController?.setFetchButton(isLoading: true)

        loadData()
    }

    // MARK: - Utilities

    private func loadData() {
        homeService.loadResponseCodeObservable().subscribe { event in
            switch event {
            case .success(let responseCode):
                self.viewController?.updateResponseCodeValue(responseCode)
            case .error(let error):
                self.coordinator.showAlert(for: error)
            }
            self.viewController?.setFetchButton(isLoading: false)
        }
        .disposed(by: disposeBag)
    }
}
