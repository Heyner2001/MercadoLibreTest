//
//  StringSources.swift
//  MercadoLibreTest
//
//  Created by Heyner Rodriguez on 16/06/21.
//

import Foundation

let stringSources = StringSources()
class StringSources {
    
    //Urls
    let urlBase: String = "https://api.mercadolibre.com"
    let countryCurrenciesPath = "/sites/MCO"
    
    func getItems(of categoryId: String) -> String {
        return getAllUrl(of: countryCurrenciesPath) + "/search?category=" + categoryId
    }
    
    func getAllUrl(of path: String) -> String {
        return urlBase + path
    }
    
    //File names
    let logoImage = "MLImage"
    let searchImage = "static_ic_search"
    let backImage = "static_ic_back"
    let simpleArrow = "static_ic_simple_arrow"
    
    //Copies
    let searchPlaceholder = "Busca tus productos"
    let categoriesTitle = "Categorías"
    
    //Keys
    let categoriesCellKey = "CategoriesCellKey"
    let categoriesHeaderKey = "CategoriesHeader"
    let productCellKey = "productCellKey"
}
