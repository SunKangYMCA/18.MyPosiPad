//
//  AddProductView.swift
//  MyPosiPad
//
//  Created by 강성찬 on 2023-10-25.
//

import SwiftUI
import PhotosUI

struct AddProductView: View {
    
    @State var product: Product = Product(name: "", price: 0, quantity: 1, smallPicture: "", largePicture: "", type: ProductType.foods, size: "", color: "")
    @State private var selectedPhotoItem: PhotosPickerItem? = nil
    
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
            HStack {
                Text("Name:  ")
                TextField("Name", text: $product.name)
                    .textFieldStyle(.roundedBorder)
            }
            
            HStack {
                Text("Price:  $")
                TextField("ProductPrice ex)$ 0.00", value: $product.price, formatter: NumberFormatter())
                    .textFieldStyle(.roundedBorder)
            }
            
            HStack {
                Text("Picture:  ")
                
                PhotosPicker(selection: $selectedPhotoItem, matching: .images) {
                    
                    Text(product.largePicture.isEmpty ? "Select Picture" : "Selected!!")
                        .foregroundStyle(product.largePicture.isEmpty ? .red: .green)

                }
                
                .onChange(of: selectedPhotoItem) { oldItem, newItem in
                    Task {
                        if let data = try? await newItem?.loadTransferable(type: Data.self) {
                            let base64String = data.base64EncodedString()
                            product.largePicture = base64String
                            
                        }
                    }
                }
                
                Spacer()
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
                Spacer()
            }
            
            HStack {
                Text("Size:  ")
                TextField("Product Size, selectable", text: $product.size)
                    .textFieldStyle(.roundedBorder)
            }
            
            HStack {
                Text("Color:  ")
                TextField("Product Color, selectable", text: $product.color)
                    .textFieldStyle(.roundedBorder)
            }
        }
        .padding(.horizontal, 100)
    }
    
    private var addNewProductButton: some View {
        
        Button {
            onAddNewProduct(product)
        } label: {
            Text("Add New Product")
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
