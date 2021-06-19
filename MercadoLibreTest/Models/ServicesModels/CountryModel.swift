//
//  CountryModel.swift
//  MercadoLibreTest
//
//  Created by Heyner Rodriguez on 17/06/21.
//

import Foundation
import RxSwift

struct CountryModel: Decodable {
    let id: String
    let name: String
    let countryId: String
    let saleFeesMode: String
    let mercadopagoVersion: Int
    let defaultCurrencyId: String
    let immediatePayment: String
    let paymentMethodIds: [String]
    let settings: CountrySettingsModel
    let currencies: [Currencies]
    let categories: [CategoryModel]
    let channels: [String]
    
    enum CodingKeys: String, CodingKey {
        case id, name, settings, currencies, categories, channels
        case countryId = "country_id"
        case saleFeesMode = "sale_fees_mode"
        case mercadopagoVersion = "mercadopago_version"
        case defaultCurrencyId = "default_currency_id"
        case immediatePayment = "immediate_payment"
        case paymentMethodIds = "payment_method_ids"
    }
}

struct CountrySettingsModel: Decodable {
    let identificationTypes: [String]
    let taxpayerTypes: [String]
    var identificationTypesRules: String? = nil
    
    enum CodingKeys: String, CodingKey {
        case identificationTypes = "identification_types"
        case taxpayerTypes = "taxpayer_types"
        case identificationTypesRules = "identification_types_rules"
    }
    
}

struct Currencies: Decodable {
    let id: String
    let symbol: String
    
    enum CondingKeys: String, CodingKey {
        case id, symbol
    }
}

var countryData: CountryModel?
let countryModelLogic = CountryModelLogic()
class CountryModelLogic {
    
    let publishSubject = PublishSubject<CountryModel>()
    func requestGetCountryData() {
        networkManager.requestGet(urlPath: stringSources.getAllUrl(of: stringSources.countryCurrenciesPath))
            .observe(on: networkManager.serialSchedule)
            .retry(3)
            .subscribe(on: networkManager.concurrentSchedule)
            .map { data in
                countryData = try? JSONDecoder().decode(CountryModel.self, from: data)
                guard let countryInfo = countryData else { return }
                self.publishSubject.on(.next(countryInfo))
                self.publishSubject.dispose()
            }
            .subscribe(onCompleted: {})
            .disposed(by: networkManager.disposeBag)
    }
}
