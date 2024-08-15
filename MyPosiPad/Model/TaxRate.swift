//
//  TaxRate.swift
//  MyPosiPad
//
//  Created by 강성찬 on 2024-08-14.
//

import Foundation

enum TaxRate: Identifiable, CaseIterable {
    case five, thirteen, fifteen
    
    var id: Self {
        self
    }
    
    var title: String {
        switch self {
        case .five:
            return "5%"
        case .thirteen:
            return "13%"
        case .fifteen:
            return "15%"
        }
    }
    
    var rate: Double {
        switch self {
        case .five:
            return 0.05
        case .thirteen:
            return 0.13
        case .fifteen:
            return 0.15
        }
    }
}
