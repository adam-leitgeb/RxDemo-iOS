//
//  APIAdapter+RxSwift.swift
//
//  Created by Adam Leitgeb on 11/02/2019.
//  Copyright © 2019 Adam Leitgeb. All rights reserved.
//

import APIAdapter
import RxSwift

extension APIAdapter {
    func request<T: Codable>(_ request: Request, modelType: T.Type) -> Observable<T> {
        return Single<T>.create { single in
            self.request(request, modelType: modelType) { throwableResult in
                do {
                    let model = try throwableResult()
                    single(.success(model))
                } catch {
                    single(.error(error))
                }
            }
            // I plan to implement canceling of requests in future version of APIAdapter. 
            return Disposables.create {}
        }.asObservable()
    }
}
