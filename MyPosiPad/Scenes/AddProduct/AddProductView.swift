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
        VStack(alignment: .center, spacing: 30) {
            productImageAddView
            
            productInfomationAddView
            
            productAddButton
            
        }
    }
    
    
    private var productImageAddView: some View {
        Image(systemName: "person")
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
                    TextField("ProductpPrice ex)$ 0.00", value: $product.price, format: .number)
                        .textFieldStyle(.roundedBorder)
                }
                
                HStack {
                    Text("Quantity:  ")
                    TextField("ProductQuantity ex) 1", value: $product.quantity, format: .number)
                        .textFieldStyle(.roundedBorder)
                }
                
                HStack {
                    Text("SmallPicture:  ")
                    TextField("ProductSmallPicture", text: $product.smallPicture)
                        .textFieldStyle(.roundedBorder)
                        .buttonStyle(.bordered)
                }
                
                HStack {
                    Text("LargePicture:  ")
                    TextField("ProductLargePicture", text: $product.largePicture)
                        .textFieldStyle(.roundedBorder)
                        .buttonStyle(.bordered)
                }
                
                HStack {
                    Text("Type:  ")
                    Picker("Type", selection: $product.type) {
                        ForEach(ProductType.allCases) { type in
                            Text(type.title)
                                }
                            }
                }
                
                HStack {
                    Text("Size:  ")
                    TextField("Product size", text: $product.size)
                        .textFieldStyle(.roundedBorder)
                        .buttonStyle(.bordered)
                }
                
                HStack {
                    Text("Color:  ")
                    TextField("Product Color", text: $product.color)
                        .textFieldStyle(.roundedBorder)
                        .buttonStyle(.bordered)
                }
            }
        }
        .padding(.horizontal, 100)
    }
    
    private var productAddButton: some View {
        
        Button {

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
        AddProductView()
    }
}
