//
//  CartListManager.swift
//  MyPosiPad
//
//  Created by 강성찬 on 2023-10-11.
//

import Foundation

class CartListManager: ObservableObject {
    
    @Published var products: [Product] = []
    @Published var totalPrice: Double = 0
    
    static var shared = CartListManager()
    
    func addToCartList(product: Product) {
        if let index = products.firstIndex(where: { $0.id == product.id }) {
            products[index].quantity += 1
            totalPrice += products[index].price
        } else {
            products.append(product)
            totalPrice += product.price
        }
    }
    
    func removeFromeCartList(product: Product) {
        products = products.filter { $0.id != product.id }
        totalPrice -= product.price * Double(product.quantity)
        if products.isEmpty {
            totalPrice = 0
        }
    }
}
