
//  UserDefaultsManger.swift
//  MyPos
//
//  Created by 강성찬 on 2023-09-21.
//

import SwiftUI

class UserDefaultsManager {
    
    @AppStorage("USER_KEY") var isUserLogged = false
    
    static var shared = UserDefaultsManager()
    
//    func saveProduct(_ product: [Product]) {
//        if let data = try? JSONEncoder().encode(product) {
//            UserDefaults.standard.set(data, forKey: "SAVE_KEY")
//        }
//    }
//
//    func loadProducts() -> [Product] {
//        if let savedData = UserDefaults.standard.object(forKey: "SAVE_KEY") as? Data {
//            if let decodedData = try? JSONDecoder().decode([Product].self, from: savedData) {
//                return decodedData
//            }
//        }
//        return []
//    }
}
