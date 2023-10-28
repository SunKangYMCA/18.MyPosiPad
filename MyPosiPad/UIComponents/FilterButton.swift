//
//  FilterButton.swift
//  MyPosiPad
//
//  Created by 강성찬 on 2023-10-26.
//

import SwiftUI

struct FilterButton: View {
    
    var title: String
    var onTabButton: () -> ()
    
    var body: some View {
        
        Button {
            onTabButton()
        } label: {
            Text(title)
                .font(.system(size: 24, weight: .bold))
                .padding()
                .background(
                    Color.indigo
                        .opacity(0.3)
                        .cornerRadius(15)
                )
        }
    }
}

struct FilterButton_Previews: PreviewProvider {
    static var previews: some View {
        FilterButton(title: "", onTabButton: {})
    }
}
