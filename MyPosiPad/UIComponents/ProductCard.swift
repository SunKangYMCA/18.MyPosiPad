//
//  ProductCard.swift
//  MyPosiPad
//
//  Created by 강성찬 on 2023-10-10.
//

import SwiftUI

struct ProductCard: View {
    
    var product: Product
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            ZStack(alignment: .bottom) {
                ZStack(alignment: .top) {
                    Color.yellow
                        .opacity(0.7)
                        .cornerRadius(20)
                    //Add Image Decoding
                    if let imageData = Data(base64Encoded: product.unwrappedLargePicture),
                       let uiImage = UIImage(data: imageData) {
                        Image(uiImage: uiImage)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 150, height: 150)
                            .background(Color.white)
                            .cornerRadius(20)
                            .padding()
                    } else {
                        Image(product.unwrappedLargePicture)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 150, height: 150)
                            .background(Color.white)
                            .cornerRadius(20)
                            .padding()
                    }
                }
                
                VStack(alignment: .leading) {
                    Text(product.unwrappedName)
                        .foregroundColor(.black)
                        .font(.system(size: 16, weight: .bold))
                    
                    Text("$" + String(format: "%.2f", product.price))
                        .foregroundColor(.black)
                        .font(.system(size: 12, weight: .regular))
                    
                }
                .padding(.horizontal)
                .frame(width: 170, alignment: .leading)
                .background(.ultraThinMaterial)
                .cornerRadius(20)
            }
            .frame(width: 150, height: 190)
            .shadow(radius: 3)
        }
    }
}
struct ProductCard_Previews: PreviewProvider {
    static var previews: some View {
        ProductCard(product: Product())
    }
}
