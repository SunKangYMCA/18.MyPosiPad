//
//  AddProductView.swift
//  MyPosiPad
//
//  Created by 강성찬 on 2023-10-25.
//

import SwiftUI

struct AddProductView: View {
    
    @State var product: Product = Product(name: "", price: 0, quantity: 1, smallPicture: "", largePicture: "", type: ProductType.foods, size: "", color: "")
    var onAddNewProduct: (Product) -> ()
    
    var body: some View {
        VStack(alignment: .center, spacing: 30) {
            Text("Add New Product")
                .foregroundColor(.brown)
                .font(.system(size: 32, weight: .bold))
            
            productInfomationAddView
            
            addNewProductButton
            
        }
    }
    
    private var productInfomationAddView: some View {
        
        VStack(alignment: .center, spacing: 20) {
            VStack(alignment: .leading, spacing: 30) {
                HStack {
                    Text("Name:  ")
                    TextField("Name", text: $product.name)
                        .textFieldStyle(.roundedBorder)
                }
                
                HStack {
                    Text("Price:  $")
                    TextField("ProductpPrice ex)$ 0.00", value: $product.price, formatter: NumberFormatter())
                        .textFieldStyle(.roundedBorder)
                }
                
                HStack {
                    Text("Type:  ")
                    Picker("Type", selection: $product.type) {
                        ForEach(ProductType.allCases) { type in
                            if type != .all {
                                Text(type.title)
                            }
                        }
                    }
                }
                
                HStack {
                    Text("Size:  ")
                    TextField("Product size, selectable", text: $product.size)
                        .textFieldStyle(.roundedBorder)
                        .buttonStyle(.bordered)
                }
                
                HStack {
                    Text("Color:  ")
                    TextField("Product Color, selectable", text: $product.color)
                        .textFieldStyle(.roundedBorder)
                        .buttonStyle(.bordered)
                }
            }
        }
        .padding(.horizontal, 100)
    }
    
    private var addNewProductButton: some View {
        
        Button {
            onAddNewProduct(product)
        } label: {
            Text("add New Product")
                .font(.system(size: 32, weight: .heavy))
                .foregroundColor(.white)
                .frame(width: 300, height: 100)
                .background(
                    Color.blue
                        .opacity(0.5)
                        .cornerRadius(15)
                    )
        }
    }
}

struct AddProductView_Previews: PreviewProvider {
    static var previews: some View {
        AddProductView(onAddNewProduct: { _ in})
    }
}
