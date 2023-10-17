//
//  MainViewModel.swift
//  MyPosiPad
//
//  Created by 강성찬 on 2023-10-10.
//

import SwiftUI

class MainViewModel: ObservableObject {
    
    let columns: [GridItem] = [GridItem(.adaptive(minimum: 160), spacing: 20)
    ]
    
    @Published var products: [Product] = [
        Product(name: "Banana", price: 0.45, quantity: 1, smallPicture: "BananaSmall", largePicture: "BananaLarge", size: "None", color: "None"),
        Product(name: "Orenge", price: 0.99, quantity: 1, smallPicture: "OrangeSmall", largePicture: "OrangeLarge", size: "None", color: "None"),
        Product(name: "Apple", price: 1.55, quantity: 1, smallPicture: "AppleSmall", largePicture: "AppleLarge", size: "None", color: "None"),
        Product(name: "Pear", price: 2.99, quantity: 1, smallPicture: "PearSmall", largePicture: "PearLarge", size: "None", color: "None"),
        Product(name: "Grapes", price: 5.99, quantity: 1, smallPicture: "GrapesSmall", largePicture: "GrapesLarge", size: "None", color: "None"),
        Product(name: "Tshirt", price: 10.99, quantity: 1, smallPicture: "TshirtSmall", largePicture: "TshirtLarge", size: "100cm", color: "Yellow"),
        Product(name: "Pants", price: 20.99, quantity: 1, smallPicture: "PantsSmall", largePicture: "PantsLarge", size: "32in", color: "Black"),
        Product(name: "Jacket", price: 49.99, quantity: 1, smallPicture: "JacketSmall", largePicture: "JacketLarge", size: "110cm", color: "Black"),
        Product(name: "Tissue", price: 0.19, quantity: 1, smallPicture: "TissueSmall", largePicture: "TissueLarge", size: "20*100mm", color: "White"),
        Product(name: "BarSoap", price: 3.99, quantity: 1, smallPicture: "BarSoapSmall", largePicture: "BarSoapLarge", size: "None", color: "Green"),
        Product(name: "Detergent", price: 12.99, quantity: 1, smallPicture: "DetergentSmall", largePicture: "DetergentLarge", size: "4L", color: "Red"),
        ]
    
    
}
