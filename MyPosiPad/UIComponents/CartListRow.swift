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
            //Add Image, Use largePicture because save problem
            if let imageData = Data(base64Encoded: product.unwrappedLargePicture),
               let uiImage = UIImage(data: imageData) {
                Image(uiImage: uiImage)
                    .resizable()
                    .frame(width: 80, height: 80)
                    .cornerRadius(15)
                    .padding(10)
                    .background(Color.white.cornerRadius(15))
                    .padding()
                    .shadow(radius: 5)
            } else {
                Image(product.unwrappedSmallPicture)
                    .resizable()
                    .frame(width: 80, height: 80)
                    .cornerRadius(15)
                    .padding(10)
                    .background(Color.white.cornerRadius(15))
                    .cornerRadius(15)
                    .padding()
                    .shadow(radius: 5)
            }
            
            VStack(alignment: .leading, spacing: 10) {
                Text(product.unwrappedName)
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
        CartListRow(product: Product())
            .environmentObject(CartListManager())
    }
}
