
//  UserDefaultsManger.swift
//  MyPos
//
//  Created by 강성찬 on 2023-09-21.
//

import SwiftUI

class UserDefaultsManager {
    static let shared = UserDefaultsManager()
    
    private let defaults = UserDefaults.standard

    func saveProduct(_ product: [Product]) {
        if let data = try? JSONEncoder().encode(product) {
            defaults.set(data, forKey: "SAVE")
        }
    }
    
    func loadProducts() -> [Product] {
        if let sevedProducts = defaults.data(forKey: "SAVE") {
            if let decodedProducts = try? JSONDecoder().decode([Product].self, from: sevedProducts) {
                return decodedProducts
            }
        }
        return []
    }
}
