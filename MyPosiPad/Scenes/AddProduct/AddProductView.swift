//
//  AddProductView.swift
//  MyPosiPad
//
//  Created by 강성찬 on 2023-10-25.
//

import SwiftUI

struct AddProductView: View {
    // 클로저를 사용해서 product를 보내주기
    //1. append할 곳 확인 후 add button 활성화 ok
    //2. button 누르면 화면 사라지고 추가된 product 화면에 표시되게 하기
    //3. 저장하기
    //4. card 꾹누르면 product 제거 가능하게 하기
    //5.
    
    @State var product: Product = Product(name: "", price: 0.0, quantity: 0, smallPicture: "", largePicture: "", type: ProductType.foods, size: "", color: "")
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
                    TextField("ProductpPrice ex)$ 0.00", value: $product.price, format: .number)
                        .textFieldStyle(.roundedBorder)
                }
                
                HStack {
                    Text("Quantity:  ")
                    TextField("ProductQuantity ex) 1", value: $product.quantity, format: .number)
                        .textFieldStyle(.roundedBorder)
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
