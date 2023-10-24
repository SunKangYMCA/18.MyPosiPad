//
//  MainView.swift
//  MyPosiPad
//
//  Created by 강성찬 on 2023-10-10.
//

import SwiftUI

struct MainView: View {
    
    @StateObject var viewModel: MainViewModel = MainViewModel()
    @StateObject var cartListManager: CartListManager = CartListManager()
    
    var body: some View {
        HStack {
            VStack {
                filterButton
                productListView
                addProductButton
            }
            
            Spacer()
            
            VStack {
                cartListView
                checkoutButton
            }
        }
        
        .padding(.horizontal, 30)
        .environmentObject(cartListManager)
    }
    
    private var filterButton: some View {
        Button {
            
        } label: {
            Text("foods")
                .font(.system(size: 24, weight: .bold))
                .padding()
                .background(
                    Color.indigo
                        .opacity(0.3)
                        .cornerRadius(15)
                )
        }
    }
    
    private var productListView: some View {
        ScrollView {
            LazyVGrid(columns: viewModel.columns) {
                ForEach(viewModel.products, id: \.id) { product in
                    Button {
                        cartListManager.addToCartList(product: product)
                    } label: {
                        ProductCard(product: product)
                            .foregroundColor(.black)
                    }
                    .padding()
                }
            } 
        }
    }
    
    
    
    
    
    private var cartListView: some View {
        VStack {
            Text("List")
                .font(.system(size: 48, weight: .bold))
            Divider()
            
            
            ScrollView {
                if cartListManager.products.count > 0 {
                    ForEach(cartListManager.products) { product in
                        CartListRow(product: product)
                    }
                    
                    HStack {
                        Text("Your List total is")
                            .bold()
                        Spacer()
                        
                        Text("$" + String(format: "%.2f", cartListManager.totalPrice))
                            .bold()
                    }
                } else {
                    Text("This list is still empty. Please select.")
                }
            }
        }
    }
    
    private var addProductButton: some View {
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
    
    private var checkoutButton: some View {
        NavigationLink {
         PayView()
        } label: {
            Text("Check Out\n$" + String(format: "%.2f", cartListManager.totalPrice))
                .foregroundColor(.black)
                .font(.system(size: 32, weight: .heavy))
                .frame(width: 350, height: 100)
                .background(
                    Color.red
                        .opacity(0.5)
                        .cornerRadius(15)
                    )
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(CartListManager())
    }
}
