//
//  MainView.swift
//  MyPosiPad
//
//  Created by 강성찬 on 2023-10-10.
//

import SwiftUI

struct MainView: View {

    @EnvironmentObject var cartListManager: CartListManager
    @EnvironmentObject var userManager: UserManager
    @EnvironmentObject var viewModel: MainViewModel
    
    var body: some View {
        ZStack {
            viewModel.backGroundColor.color
                .ignoresSafeArea()
                .opacity(0.2)
                .cornerRadius(20)
            VStack {
                HStack {
                    EmployeeProfileView(employee: userManager.currentEmployee)
                    
                    Spacer()
                    
                    Text(viewModel.shopName)
                        .font(.system(size: 48, weight: .bold))
                        .padding(5)
                        .background(
                            Color.white
                                .opacity(0.5)
                                .cornerRadius(20)
                        )
                    
                    Spacer()
                    
                    Button {
                        userManager.signOut()
                    } label: {
                        Text("Sign out")
                            .foregroundColor(.red)
                            .bold()
                            .padding(.vertical, 16)
                            .padding(.horizontal, 32)
                            .background(Color.gray.opacity(0.2).cornerRadius(15))
                    }
                }
                .background(
                  viewModel.bennerImage
                        .resizable()
                        .frame(height: 80)
                        .cornerRadius(15)
                )
                HStack {
                    VStack {
                        filterButtons
                        productListView
                        addProductButton
                    }
                    
                    Spacer()
                    
                    VStack {
                        cartListView
                        checkOutButton
                    }
                }
                .onAppear {
                    viewModel.products = viewModel.allProducts
                }
                
                .padding(.horizontal, 30)
                .environmentObject(cartListManager)
            }
        }
    }
    
    private var filterButtons: some View {
        HStack(spacing: 20) {
            Button {
                viewModel.onFilterButtonTap(type: .all)
            } label: {
                Text("All")
                    .font(.system(size: 24, weight: .bold))
                    .padding()
                    .background(
                        viewModel.selectedFilterType == .all ? Color.red.opacity(0.3) : Color.indigo.opacity(0.3)
                    )
                    .cornerRadius(15)
            }
            
            Button {
                viewModel.onFilterButtonTap(type: .foods)
            } label: {
                Text("Foods")
                    .font(.system(size: 24, weight: .bold))
                    .padding()
                    .background(
                        viewModel.selectedFilterType == .foods ? Color.red.opacity(0.3) : Color.indigo.opacity(0.3)
                    )
                    .cornerRadius(15)
            }
            
            Button {
                viewModel.onFilterButtonTap(type: .clothes)
            } label: {
                Text("Clothes")
                    .font(.system(size: 24, weight: .bold))
                    .padding()
                    .background(
                        viewModel.selectedFilterType == .clothes ? Color.red.opacity(0.3) : Color.indigo.opacity(0.3)
                    )
                    .cornerRadius(15)
            }
            
            Button {
                viewModel.onFilterButtonTap(type: .homes)
            } label: {
                Text("Homes")
                    .font(.system(size: 24, weight: .bold))
                    .padding()
                    .background(
                        viewModel.selectedFilterType == .homes ? Color.red.opacity(0.3) : Color.indigo.opacity(0.3)
                    )
                    .cornerRadius(15)
            }
        }
    }
    
    private var productListView: some View {
        ScrollView {
            LazyVGrid(columns: viewModel.columns) {
                ForEach(viewModel.products, id: \.id) { product in
                    Button {
                        cartListManager.addToCartList(product: product)
                        cartListManager.showTotalTax()
                    } label: {
                        ProductCard(product: product)
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
                        Text("Tax" + String(format: "%.2f", cartListManager.totalTax))
                    }
                } else {
                    Text("This list is still empty. Please select.")
                }
            }
        }
    }
    
    private var addProductButton: some View {
        Button {
            viewModel.showAddProductView.toggle()
            viewModel.selectedFilterType = .all
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
        .sheet(isPresented: $viewModel.showAddProductView) {
            if viewModel.showAddProductView {
                AddProductView { newProduct in
                    viewModel.addNewProduct(newProduct)
                }
            }
        }
    }
    
    private var checkOutButton: some View {
        NavigationLink {
            PayView()
        } label: {
            Text("Check Out\n$" + String(format: "%.2f", cartListManager.totalPrice + cartListManager.totalTax))
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
            .previewInterfaceOrientation(.landscapeRight)
            .environmentObject(UserManager())
    }
}
