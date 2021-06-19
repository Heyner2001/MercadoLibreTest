//
//  CategoryModel.swift
//  MercadoLibreTest
//
//  Created by Heyner Rodriguez on 17/06/21.
//

import Foundation
import RxSwift

struct CategoryModel: Decodable {
    let id: String
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case id, name
    }
}

let categoryLogic = CategoryModelLogic()
class CategoryModelLogic {
    
    let productModelLogic = ProductModelLogic()
    func requestGetProducts(url: String) {
        networkManager.requestGet(urlPath: url)
            .observe(on: networkManager.serialSchedule)
            .retry(3)
            .subscribe(on: networkManager.concurrentSchedule)
            .map { data in
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                    let productsJson: [Any]? = json?["results"] as? [Any]
                    guard let object = productsJson else { return }
                    self.productModelLogic.objectCreation(object: object)
                }
            }
            .subscribe(onCompleted: {})
            .disposed(by: networkManager.disposeBag)
    }
}
