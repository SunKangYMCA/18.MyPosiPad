//
//  MainViewModel.swift
//  MyPosiPad
//
//  Created by 강성찬 on 2023-10-10.
//

import SwiftUI
import PhotosUI
import CoreData

class MainViewModel: ObservableObject {
    
    @Published var showAddProductView: Bool = false
    @Published var selectedFilterType: ProductType = .all
    @Published var products: [Product] = []
    @Published var backGroundColor: BackGroundColor = .white
    @Published var shopName: String = "ShopName"
    @Published var benner: PhotosPickerItem?
    @Published var bennerImage: Image = Image("sky")
    @Published var showReceipt: Bool = false
    @Published var isLongPressing: Bool = false
    @Published var isSearching: Bool = false
    @Published var searchText: String = ""
    @Published var filteredProducts: [Product] = []
    
    init() {
        populateDefaultProducts()
        fetchProducts()
    }
    
    let columns: [GridItem] = [
        GridItem(.fixed(200)),
        GridItem(.fixed(200)),
        GridItem(.fixed(200)),
        GridItem(.fixed(200))
    ]
    
    @Published var defaultProducts: [ProductData]  = [
        ProductData(id: UUID(), name: "Banana", price: 0.45, quantity: 1, smallPicture: "BananaSmall", largePicture: "BananaLarge", type: .foods, size: "None", color: "None"),
        ProductData(id: UUID(),name: "Orange", price: 0.99, quantity: 1, smallPicture: "OrangeSmall", largePicture: "OrangeLarge", type: .foods, size: "None", color: "None"),
        ProductData(id: UUID(),name: "Apple", price: 1.55, quantity: 1, smallPicture: "AppleSmall", largePicture: "AppleLarge", type: .foods, size: "None", color: "None"),
        ProductData(id: UUID(),name: "Pear", price: 2.99, quantity: 1, smallPicture: "PearSmall", largePicture: "PearLarge", type: .foods, size: "None", color: "None"),
        ProductData(id: UUID(),name: "Grapes", price: 5.99, quantity: 1, smallPicture: "GrapesSmall", largePicture: "GrapesLarge", type: .foods, size: "None", color: "None"),
        ProductData(id: UUID(),name: "Tshirt", price: 10.99, quantity: 1, smallPicture: "TshirtSmall", largePicture: "TshirtLarge", type: .clothes, size: "100cm", color: "Yellow"),
        ProductData(id: UUID(),name: "Pants", price: 20.99, quantity: 1, smallPicture: "PantsSmall", largePicture: "PantsLarge", type: .clothes, size: "32in", color: "Black"),
        ProductData(id: UUID(),name: "Jacket", price: 49.99, quantity: 1, smallPicture: "JacketSmall", largePicture: "JacketLarge", type: .clothes, size: "110cm", color: "Black"),
        ProductData(id: UUID(),name: "Tissue", price: 0.19, quantity: 1, smallPicture: "TissueSmall", largePicture: "TissueLarge", type: .homes, size: "20*100mm", color: "White"),
        ProductData(id: UUID(),name: "BarSoap", price: 3.99, quantity: 1, smallPicture: "BarSoapSmall", largePicture: "BarSoapLarge", type: .homes, size: "None", color: "Green"),
        ProductData(id: UUID(),name: "Detergent", price: 12.99, quantity: 1, smallPicture: "DetergentSmall", largePicture: "DetergentLarge", type: .homes, size: "4L", color: "Red")
    ]
    
    func populateDefaultProducts() {
        for defaultProduct in defaultProducts {
            let fetchRequest: NSFetchRequest<Product> = Product.fetchRequest()
            fetchRequest.predicate = NSPredicate(format: "name == %@", defaultProduct.name)
            
            if let results = try? Persistence.shared.container.viewContext.fetch(fetchRequest), results.isEmpty {
                
                let product = Product(context: Persistence.shared.container.viewContext)
                
                product.id = defaultProduct.id
                product.name = defaultProduct.name
                product.price = defaultProduct.price
                product.quantity = Int16(defaultProduct.quantity)
                product.smallPicture = defaultProduct.smallPicture
                product.largePicture = defaultProduct.largePicture
                product.type = defaultProduct.type.rawValue
                product.size = defaultProduct.size
                product.color = defaultProduct.color
                
            }
        }
        Persistence.shared.saveContext()
    }
    
    func fetchProducts() {
        let fetchRequest: NSFetchRequest<Product> = Product.fetchRequest()
        
        do {
            products = try Persistence.shared.container.viewContext.fetch(fetchRequest)
        } catch {
            print("Failed to fetch products: \(error.localizedDescription)")
        }
        
    }
    
    private func filterProduct(type: ProductType) {
        
//        if type != .all {
//            products = products.filter { $0.type == type }
//        }
    }
    

        
    func onFilterButtonTap(type: ProductType) {
        filterProduct(type: type)
        selectedFilterType = type
    }
    
    func hideReceipt() {
        showReceipt = false
    }
    
    func applyNameFilter() {
//        let query = searchText.lowercased()
//        if query.isEmpty {
//            filteredProducts = allProducts
//        } else {
//        filteredProducts = products.filter { product in
//            product.unwrappedName.lowercased().contains(query)
//            }
//        }
    }
}
//    @Published var allProducts: [Product] = [
//        Product(name: "Banana", price: 0.45, quantity: 1, smallPicture: "BananaSmall", largePicture: "BananaLarge", type: .foods, size: "None", color: "None"),
//        Product(name: "Orange", price: 0.99, quantity: 1, smallPicture: "OrangeSmall", largePicture: "OrangeLarge", type: .foods, size: "None", color: "None"),
//        Product(name: "Apple", price: 1.55, quantity: 1, smallPicture: "AppleSmall", largePicture: "AppleLarge", type: .foods, size: "None", color: "None"),
//        Product(name: "Pear", price: 2.99, quantity: 1, smallPicture: "PearSmall", largePicture: "PearLarge", type: .foods, size: "None", color: "None"),
//        Product(name: "Grapes", price: 5.99, quantity: 1, smallPicture: "GrapesSmall", largePicture: "GrapesLarge", type: .foods, size: "None", color: "None"),
//        Product(name: "Tshirt", price: 10.99, quantity: 1, smallPicture: "TshirtSmall", largePicture: "TshirtLarge", type: .clothes, size: "100cm", color: "Yellow"),
//        Product(name: "Pants", price: 20.99, quantity: 1, smallPicture: "PantsSmall", largePicture: "PantsLarge", type: .clothes, size: "32in", color: "Black"),
//        Product(name: "Jacket", price: 49.99, quantity: 1, smallPicture: "JacketSmall", largePicture: "JacketLarge", type: .clothes, size: "110cm", color: "Black"),
//        Product(name: "Tissue", price: 0.19, quantity: 1, smallPicture: "TissueSmall", largePicture: "TissueLarge", type: .homes, size: "20*100mm", color: "White"),
//        Product(name: "BarSoap", price: 3.99, quantity: 1, smallPicture: "BarSoapSmall", largePicture: "BarSoapLarge", type: .homes, size: "None", color: "Green"),
//        Product(name: "Detergent", price: 12.99, quantity: 1, smallPicture: "DetergentSmall", largePicture: "DetergentLarge", type: .homes, size: "4L", color: "Red")
//    ] {
//
//        didSet {
//            UserDefaultsManager.shared.saveProducts(allProducts)
//            print("##allProduct is \(allProducts.count)##")
//        }
//    }
//    init() {
//        let savedProducts = UserDefaultsManager.shared.loadProducts()
//        if !savedProducts.isEmpty {
//            allProducts = savedProducts
//        }
//    }
