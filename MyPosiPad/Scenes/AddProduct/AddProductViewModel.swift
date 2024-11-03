//
//  AddProductViewModel.swift
//  MyPosiPad
//
//  Created by 강성찬 on 2024-09-11.
//

import SwiftUI
import PhotosUI
import CoreData

class AddProductViewModel: ObservableObject {
    
    @Published var newProduct: ProductData = ProductData(id: UUID(), name: "", price: 0, quantity: 1, smallPicture: "", largePicture: "", type: .foods, size: "", color: "")
    @Published var selectedPhotoItem: PhotosPickerItem? = nil
    
    func addNewProduct() {
        let product = Product(context: Persistence.shared.container.viewContext)
        
        if !newProduct.name.isEmpty, newProduct.price > 0 {
            product.id = newProduct.id
            product.name = newProduct.name
            product.price = newProduct.price
            product.quantity = Int16(newProduct.quantity)
            product.smallPicture = newProduct.smallPicture
            product.largePicture = newProduct.largePicture
            product.type = newProduct.type.rawValue
            product.size = newProduct.size
            product.color = newProduct.color
            
            Persistence.shared.saveContext()
            resetNewProduct()
        }
    }
    
    func resetNewProduct() {
        newProduct = ProductData(id: UUID(), name: "", price: 0, quantity: 1, smallPicture: "", largePicture: "", type: .foods, size: "", color: "")
    }
}
//func addNewProduct(_ product: Product) {
//    
//    if !product.unwrappedName.isEmpty
//        && product.price > 0 {
//        allProducts.append(product)
//        showAddProductView.toggle()
//        products = allProducts
//    }
//}
