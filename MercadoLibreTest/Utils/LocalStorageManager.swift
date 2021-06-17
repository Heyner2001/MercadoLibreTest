//
//  LocalStorageManager.swift
//  MercadoLibreTest
//
//  Created by Heyner Rodriguez on 16/06/21.
//

import Foundation

class LocalStorageManager {
    
    let shared = LocalStorageManager()
    private let defaults = UserDefaults.standard
    
    func saveData(data: Data, key: String) {
        defaults.removeObject(forKey: key)
        defaults.set(data, forKey: key)
    }
    
    func getData(key: String) -> Data? {
        return defaults.data(forKey: key)
    }
}
