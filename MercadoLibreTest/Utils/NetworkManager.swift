//
//  NetworkManager.swift
//  MercadoLibreTest
//
//  Created by Heyner Rodriguez on 16/06/21.
//

import Foundation
import Alamofire
import RxSwift

let networkManager = NetworkManager()
class NetworkManager {
    
    let disposeBag = DisposeBag()
    let serialSchedule = SerialDispatchQueueScheduler(qos: .utility)
    let concurrentSchedule = ConcurrentDispatchQueueScheduler(queue: DispatchQueue.global())
    
    private struct requestError: Swift.Error {
        var error: Error? {
            didSet {
                print(error?.localizedDescription ?? "")
            }
        }
    }
    
    func requestGet(urlPath: String) -> Observable<Data> {
        return Observable.create { observable in
            Alamofire.request(urlPath ,method: .get , encoding: URLEncoding.default)
                .validate(statusCode: 200 ..< 300)
                .responseJSON { response in
                    guard response.result.isSuccess, let data = response.data else {
                        observable.onError(requestError(error: response.error))
                        return
                    }
                    observable.onNext(data)
                    observable.onCompleted()
                }
            return Disposables.create()
        }
    }
}
