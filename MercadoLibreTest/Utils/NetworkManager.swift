//
//  NetworkManager.swift
//  MercadoLibreTest
//
//  Created by Heyner Rodriguez on 16/06/21.
//

import Foundation
import Alamofire
import RxSwift

class NetworkManager {
    
    let shared = NetworkManager()
    private let disposeBag = DisposeBag()
    private let serialSchedule = SerialDispatchQueueScheduler(qos: .background)
    private let concurrentSchedule = ConcurrentDispatchQueueScheduler(queue: DispatchQueue.global())
    
    private struct requestError: Swift.Error {}
    
    func requestGetAPI(urlPath: String, indexSection: Int) {
        requestGet(urlPath: urlPath)
            .observe(on: serialSchedule)
            .retry(3)
            .subscribe(on: concurrentSchedule)
            .observe(on: MainScheduler.instance)
            .do(onDispose:  { })
            .subscribe(onCompleted: {})
            .disposed(by: disposeBag)
    }
    
    private func requestGet(urlPath: String) -> Observable<Data> {
        return Observable.create { observable in
            Alamofire.request(StringSources.shared.urlBase + urlPath ,method: .get , encoding: URLEncoding.default)
                .validate(statusCode: 200 ..< 300)
                .responseJSON { response in
                    
                    guard response.result.isSuccess, let data = response.data else {
                        observable.onError(requestError())
                        return
                    }
                    
                    observable.onNext(data)
                    observable.onCompleted()
                }
            return Disposables.create()
        }
    }
}
