//
//  Product.swift
//  MyPosiPad
//
//  Created by 강성찬 on 2023-10-10.
//

import Foundation

struct Product: Codable, Identifiable, Hashable {
    var id: UUID = UUID()
    var name: String
    var price: Double
    var quantity: Int
    var smallPicture: String
    var largePicture: String
    var type: ProductType
    var size: String
    var color: String
}
