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
    @Published var totalTax: Double = 0
    @Published var taxRate: TaxRate = .five
    
    func addToCartList(product: Product) {
        if let index = products.firstIndex(where: {$0.id == product.id}) {
            products[index].quantity += 1
        } else {
            products.append(product)
        }
        totalPrice += product.price
        totalTax += product.price * taxRate.rate
    }
    
    func removeFromCartList(product: Product) {
        if let index = products.firstIndex(where: {$0.id == product.id}) {
            products[index].quantity -= 1
            if products[index].quantity == 0 {
                // filter -> remove
                products.remove(at: index)
            }
            totalPrice -= product.price
            totalTax -= product.price * taxRate.rate
        }
        // showTotalTax delete, add totalTax +=
    }
}
