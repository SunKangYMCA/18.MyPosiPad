//
//  Product.swift
//  MyPosiPad
//
//  Created by 강성찬 on 2023-10-10.
//

import Foundation

extension Product {
    var unwrappedColor: String {
        guard let color = color else {
            return ""
        }
        return color
    }
    
    var unwrappedId: UUID {
        guard let id = id else {
            return UUID()
        }
        return id
    }
    
    var unwrappedLargePicture: String {
        guard let largePicture = largePicture else {
            return ""
        }
        return largePicture
    }
    
    var unwrappedName: String {
        guard let name = name else {
            return ""
        }
        return name
    }
    
    var unwrappedSize: String {
        guard let size = size else {
            return ""
        }
        return size
    }
    
    var unwrappedSmallPicture: String {
        guard let smallPicture = smallPicture else {
            return ""
        }
        return smallPicture
    }
    
    var unwrappedType: String {
        guard let type = type else {
            return ""
        }
        return type
    }
}

//struct Product: Codable, Identifiable, Hashable {
//    var id: UUID = UUID()
//    var name: String
//    var price: Double
//    var quantity: Int
//    var smallPicture: String
//    var largePicture: String
//    var type: ProductType
//    var size: String
//    var color: String
//}
