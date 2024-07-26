//
//  MainViewModel.swift
//  MyPosiPad
//
//  Created by 강성찬 on 2023-10-10.
//

import SwiftUI

class MainViewModel: ObservableObject {
    
    @Published var showAddProductView: Bool = false
    @Published var selectedFilterType: ProductType = .all
    
    let columns: [GridItem] = [
        GridItem(.fixed(200)),
        GridItem(.fixed(200)),
        GridItem(.fixed(200)),
        GridItem(.fixed(200))
    ]
    
    @Published var allProducts: [Product] = [
        Product(name: "Banana", price: 0.45, quantity: 1, smallPicture: "BananaSmall", largePicture: "BananaLarge", type: .foods, size: "None", color: "None"),
        Product(name: "Orange", price: 0.99, quantity: 1, smallPicture: "OrangeSmall", largePicture: "OrangeLarge", type: .foods, size: "None", color: "None"),
        Product(name: "Apple", price: 1.55, quantity: 1, smallPicture: "AppleSmall", largePicture: "AppleLarge", type: .foods, size: "None", color: "None"),
        Product(name: "Pear", price: 2.99, quantity: 1, smallPicture: "PearSmall", largePicture: "PearLarge", type: .foods, size: "None", color: "None"),
        Product(name: "Grapes", price: 5.99, quantity: 1, smallPicture: "GrapesSmall", largePicture: "GrapesLarge", type: .foods, size: "None", color: "None"),
        Product(name: "Tshirt", price: 10.99, quantity: 1, smallPicture: "TshirtSmall", largePicture: "TshirtLarge", type: .clothes, size: "100cm", color: "Yellow"),
        Product(name: "Pants", price: 20.99, quantity: 1, smallPicture: "PantsSmall", largePicture: "PantsLarge", type: .clothes, size: "32in", color: "Black"),
        Product(name: "Jacket", price: 49.99, quantity: 1, smallPicture: "JacketSmall", largePicture: "JacketLarge", type: .clothes, size: "110cm", color: "Black"),
        Product(name: "Tissue", price: 0.19, quantity: 1, smallPicture: "TissueSmall", largePicture: "TissueLarge", type: .homes, size: "20*100mm", color: "White"),
        Product(name: "BarSoap", price: 3.99, quantity: 1, smallPicture: "BarSoapSmall", largePicture: "BarSoapLarge", type: .homes, size: "None", color: "Green"),
        Product(name: "Detergent", price: 12.99, quantity: 1, smallPicture: "DetergentSmall", largePicture: "DetergentLarge", type: .homes, size: "4L", color: "Red")
    ] {
        
        didSet {
            UserDefaultsManager.shared.saveProduct(allProducts)
            print("##allProduct is \(allProducts.count)##")
        }
    }
    init() {
        let savedProducts = UserDefaultsManager.shared.loadProducts()
        if !savedProducts.isEmpty {
            allProducts = savedProducts
        }
    }
    
    @Published var products: [Product] = []
    
    private func filterProduct(type: ProductType) {
        products = allProducts
        if type != .all {
            products = products.filter { $0.type == type }
        }
    }
        
    func onFilterButtonTap(type: ProductType) {
        filterProduct(type: type)
        selectedFilterType = type
    }
    
    func addNewProduct(_ product: Product) {
        
        if !product.name.isEmpty
            && product.price > 0 {            
            allProducts.append(product)
            showAddProductView.toggle()
            products = allProducts
        }
    }
    
}
