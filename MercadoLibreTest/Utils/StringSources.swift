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
    
    func getSearchUrl(search: String) -> String {
        let searchText = search.replacingOccurrences(of: " ", with: "%")
        return getAllUrl(of: countryCurrenciesPath) + "/search?q=" + searchText
    }
    
    func getAllUrl(of path: String) -> String {
        return urlBase + path
    }
    
    //File names
    let logoImage = "MLImage"
    let searchImage = "static_ic_search"
    let backImage = "static_ic_back"
    let simpleArrow = "static_ic_simple_arrow"
    let closeImage = "static_ic_close"
    
    //Copies
    let searchPlaceholder = "Busca en Mercado Libre"
    let categoriesTitle = "Categorías"
    private let soldQuantityString = "Unidades vendidas: "
    let conditionString = "Condición del producto: "
    
    func soldQuantityText(quantity: Int) -> String {
        return soldQuantityString + String(quantity)
    }
    
    //Keys
    let categoriesCellKey = "CategoriesCellKey"
    let categoriesHeaderKey = "CategoriesHeader"
    let productCellKey = "productCellKey"
}
