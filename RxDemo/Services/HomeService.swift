//
//  HomeService.swift
//
//  Created by Adam Leitgeb on 10/02/2019.
//  Copyright (c) 2019 Adam Leitgeb. All rights reserved.
//

import APIAdapter
import BoilerplateKit
import RxSwift

protocol HomeService: Service {
    var timesFetched: Variable<Int> { get }

    func loadResponseCodeObservable() -> Single<String>
}

final class ProductionHomeService: HomeService {

    // MARK: - Properties

    private let defaults: UserDefaults = .standard
    private let apiAdapter: APIAdapter

    enum UserDefaultsKeys {
        static let timesFetched: String = "UserDefaultsKeys.timesFetched"
    }

    // MARK: - Initialization

    init(apiAdapter: APIAdapter) {
        self.apiAdapter = apiAdapter
    }

    // MARK: - Service interface

    lazy var timesFetched: Variable<Int> = {
        let timesFetched = defaults.integer(forKey: UserDefaultsKeys.timesFetched)
        return Variable(timesFetched)
    }()

    func loadResponseCodeObservable() -> Single<String> {
        return fetchPath()
            .flatMap { newUrl in
                return self.fetchResponseCode(newUrl: newUrl)
            }
            .map { responseCode in
                self.updateTimesFetched()
                return responseCode
            }
            .asSingle()
    }

    // MARK: - Requests

    struct GetResponseCodeRequest: Request {
        var baseURL: URL = URL(string: "http://localhost:8000")!
        var path: String = ""
        var method: HTTPMethod = .get
        var requestData: RequestData = .none
    }

    // MARK: - Responses

    struct NextPathResponse: Codable {
        let nextPath: URL

        enum CodingKeys: String, CodingKey {
            case nextPath = "next_path"
        }
    }

    struct ResponseCodeResponse: Codable {
        let responseCode: String

        enum CodingKeys: String, CodingKey {
            case responseCode = "response_code"
        }
    }

    // MARK: - Utilities

    func fetchPath() -> Observable<URL> {
        let getResponseCodeRequest = GetResponseCodeRequest()
        return apiAdapter.request(getResponseCodeRequest, modelType: NextPathResponse.self).map {
            $0.nextPath
        }
    }

    func fetchResponseCode(newUrl: URL) -> Single<String> {
        var getResponseCodeRequest = GetResponseCodeRequest()
        getResponseCodeRequest.baseURL = newUrl

        return apiAdapter.request(getResponseCodeRequest, modelType: ResponseCodeResponse.self).map {
            $0.responseCode
        }.asSingle()
    }

    // Synchronize

    func updateTimesFetched() {
        let currentValue = defaults.integer(forKey: UserDefaultsKeys.timesFetched)
        let newValue = currentValue + 1

        defaults.set(newValue, forKey: UserDefaultsKeys.timesFetched)
        timesFetched.value = newValue
    }
}
