//
//  ProductModel.swift
//  MercadoLibreTest
//
//  Created by Heyner Rodriguez on 17/06/21.
//

import Foundation
import RxSwift

struct ProductModel {
    let id: String
    let siteId: String?
    let title: String
    let price: Int
    let currencyId: String
    let availableQuantity: Int
    let soldQuantity: Int?
    let image: String
    let categoryId: String?
}

var products: [ProductModel]?
class ProductModelLogic {
    
    let publishSubject = PublishSubject<ProductModel>()
    func objectCreation(object: [Any]) {
        //Become the dictionary object to ProductModel custom object
        var allProducts: [ProductModel] = []
        
        products?.removeAll()
        object.forEach { obj in
            let product = obj as? [String : Any]
            // Custom ProductModel creation
            let productObject: ProductModel =
                .init(id: product?["id"] as? String ?? "",
                      siteId: product?["site_id"] as? String,
                      title: product?["title"] as? String ?? "",
                      price: product?["price"] as? Int ?? 0,
                      currencyId: product?["currency_id"] as? String ?? "$",
                      availableQuantity: product?["available_quantity"] as? Int ?? 0,
                      soldQuantity: product?["sold_quantity"] as? Int,
                      image: product?["thumbnail"] as? String ?? "",
                      categoryId: product?["category_id"] as? String)
            
            allProducts.append(productObject)
            self.publishSubject.on(.next(productObject))
            
        }
        products = allProducts
    }
}
