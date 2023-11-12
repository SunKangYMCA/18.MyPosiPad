
//  UserDefaultsManger.swift
//  MyPos
//
//  Created by 강성찬 on 2023-09-21.
//

import SwiftUI

class UserDefaultsManager {
    static var shared = UserDefaultsManager()
    
    func saveProduct(_ product: [Product]) {
        if let data = try? JSONEncoder().encode(product) {
            UserDefaults.standard.set(data, forKey: "SAVE_KEY")
        }
    }
    
    func loadedProducts() -> [Product] {
        if let savedProducts = UserDefaults.standard.object(forKey: "SAVE_KEY") as? Data {
            if let decodedProducts = try? JSONDecoder().decode([Product].self, from: savedProducts) {
                return decodedProducts
            }
        }
        return []
    }
}
