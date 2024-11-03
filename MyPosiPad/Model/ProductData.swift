//
//  ProductData.swift
//  MyPosiPad
//
//  Created by 강성찬 on 2024-11-01.
//

import Foundation

struct ProductData {
    var id: UUID
    var name: String
    var price: Double
    var quantity: Int16
    var smallPicture: String
    var largePicture: String
    var type: ProductType
    var size: String
    var color: String
}
