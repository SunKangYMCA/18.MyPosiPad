//
//  AddProductView.swift
//  MyPosiPad
//
//  Created by 강성찬 on 2023-10-25.
//

import SwiftUI
import PhotosUI
import CoreData

struct AddProductView: View {
    @StateObject var viewModel: AddProductViewModel = AddProductViewModel()
    @EnvironmentObject var mainViewModel: MainViewModel
    
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
                TextField("Name", text: $viewModel.newProduct.name)
                    .textFieldStyle(.roundedBorder)
            }
            
            HStack {
                Text("Price:  $")
                TextField("ProductPrice ex)$ 0.00", value: $viewModel.newProduct.price, formatter: NumberFormatter())
                    .textFieldStyle(.roundedBorder)
            }
            
            HStack {
                Text("Picture:  ")
                
                PhotosPicker(selection: $viewModel.selectedPhotoItem, matching: .images) {
                    
                    Text(viewModel.newProduct.largePicture.isEmpty ? "Select Picture" : "Selected!!")
                        .foregroundStyle(viewModel.newProduct.largePicture.isEmpty ? .red: .green)

                }
                
                .onChange(of: viewModel.selectedPhotoItem) { oldItem, newItem in
                    Task {
                        if let data = try? await newItem?.loadTransferable(type: Data.self) {
                            let base64String = data.base64EncodedString()
                            viewModel.newProduct.largePicture = base64String
                            
                        }
                    }
                }
                
                Spacer()
            }
            
            HStack {
                Text("Type:  ")
                Picker("Type", selection: $viewModel.newProduct.type) {
                    ForEach(ProductType.allCases) { type in
                        if type != .all {
                            Text(type.title).tag(type.rawValue)
                        }
                    }
                }
                Spacer()
            }
            
            HStack {
                Text("Size:  ")
                TextField("Product Size, selectable", text: $viewModel.newProduct.size)
                    .textFieldStyle(.roundedBorder)
            }
            
            HStack {
                Text("Color:  ")
                TextField("Product Color, selectable", text: $viewModel.newProduct.color)
                    .textFieldStyle(.roundedBorder)
            }
        }
        .padding(.horizontal, 100)
    }
    
    private var addNewProductButton: some View {
        
        Button {
            viewModel.addNewProduct()
            mainViewModel.fetchProducts()
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
        AddProductView()
    }
}
