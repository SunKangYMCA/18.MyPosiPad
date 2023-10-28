//
//  AddProductView.swift
//  MyPosiPad
//
//  Created by 강성찬 on 2023-10-25.
//

import SwiftUI

struct AddProductView: View {
    
    @State var product: Product = Product(name: "", price: 0.0, quantity: 0, smallPicture: "", largePicture: "", type: ProductType.foods, size: "", color: "")
    
    var body: some View {
        VStack {
            Image(systemName: "person")
//            TextField("Name", text: $product.name, prompt: "ProductName")
        }
    }
}

struct AddProductView_Previews: PreviewProvider {
    static var previews: some View {
        AddProductView()
    }
}
