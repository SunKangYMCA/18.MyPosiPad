//
//  CartListRow.swift
//  MyPosiPad
//
//  Created by 강성찬 on 2023-10-14.
//

import SwiftUI

struct CartListRow: View {
    
    @EnvironmentObject var cartListManager: CartListManager
    var product: Product
    
    var body: some View {
        HStack(spacing: 10) {
            if product.smallPicture.isEmpty {
                Image(systemName: "photo")
                    .resizable()
                    .frame(width: 80, height: 80)
                    .padding(10)
                    .background(Color.white)
                    .cornerRadius(15)
                    .padding()
                    .shadow(radius: 5)
            } else {
                Image(product.smallPicture)
                    .resizable()
                    .frame(width: 80, height: 80)
                    .padding(10)
                    .background(Color.white)
                    .cornerRadius(15)
                    .padding()
                    .shadow(radius: 5)
            }
            
            VStack(alignment: .leading, spacing: 10) {
                Text(product.name)
                    .bold()
                
                Text("$" + String(format: "%.2f", product.price))
            }
            
            Spacer()
            
            Text("X \(product.quantity)")
            
            Button {
                cartListManager.removeFromCartList(product: product)
            } label: {
                Image(systemName: "trash")
                    .foregroundColor(.red.opacity(0.6))
            }
        }
        .padding(.horizontal)
    }
}

struct CartListRow_Previews: PreviewProvider {
    static var previews: some View {
        CartListRow(product: Product(name: "", price: 0.0, quantity: 1, smallPicture: "", largePicture: "", type: .homes, size: "", color: ""))
            .environmentObject(CartListManager())
    }
}
