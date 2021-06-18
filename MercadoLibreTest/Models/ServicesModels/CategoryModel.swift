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
    
    func requestGetCategoryData(categoryId: String) {
        networkManager.requestGet(urlPath: stringSources.getItems(of: categoryId))
            .observe(on: networkManager.serialSchedule)
            .retry(3)
            .subscribe(on: networkManager.concurrentSchedule)
            .map { data in
                //Json parse
            }
            .subscribe(onCompleted: {})
            .disposed(by: networkManager.disposeBag)
    }
}
