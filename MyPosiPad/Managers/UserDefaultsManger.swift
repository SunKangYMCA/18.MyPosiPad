
//  UserDefaultsManger.swift
//  MyPos
//
//  Created by 강성찬 on 2023-09-21.
//

import SwiftUI

class UserDefaultsManager {
    static let shared = UserDefaultsManager()

    func saveProducts(_ product: [Product]) {
        if let data = try? JSONEncoder().encode(product) {
            UserDefaults.standard.set(data, forKey: "SAVE")
        }
    }
    
    func loadProducts() -> [Product] {
        if let savedProducts = UserDefaults.standard.data(forKey: "SAVE") {
            if let decodedProducts = try? JSONDecoder().decode([Product].self, from: savedProducts) {
                return decodedProducts
            }
        }
        return []
    }
}
