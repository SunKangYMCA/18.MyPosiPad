//
//  ReceiptProductRow.swift
//  MyPosiPad
//
//  Created by 강성찬 on 2024-08-17.
//

import SwiftUI

struct ReceiptProductRow: View {
    
    var product: Product
    
    var body: some View {
        HStack {
            Text(product.unwrappedName)
            Spacer()
            Text("\(product.quantity)")
            Text("$" + String(format: "%.2f", product.price))
        }
    }
}

#Preview {
    ReceiptProductRow(product: Product())
}
