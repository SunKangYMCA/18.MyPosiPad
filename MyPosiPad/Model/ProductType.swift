//
//  ProductType.swift
//  MyPosiPad
//
//  Created by 강성찬 on 2023-10-23.
//

import SwiftUI

enum ProductType: String, CaseIterable, Identifiable {
    case all, foods, clothes, homes
    
    var id: Self {
        self
    }
    
    var title: String {
        switch self {
        case .all:
            return "All"
        case .foods:
            return "Foods"
        case .clothes:
            return "Clothes"
        case .homes:
            return "Homes"
        }
    }
    
    var color: Color {
        switch self {
        case .all:
            return .green
        case .foods:
            return .red
        case .clothes:
            return .blue
        case .homes:
            return .orange
        }
    }
}
