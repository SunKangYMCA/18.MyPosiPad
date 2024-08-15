//
//  BackGroundColor.swift
//  MyPosiPad
//
//  Created by 강성찬 on 2024-08-14.
//

import SwiftUI

enum BackGroundColor: Identifiable, CaseIterable {
    case white, brown, indigo, orange, pink, yellow, gray, green
    
    var id: Self {
        self
    }
    
    var title: String {
        switch self {
        case .white:
            return "White"
        case .brown:
            return "Brown"
        case .indigo:
            return "Indigo"
        case .orange:
            return "Orange"
        case .pink:
            return "Pink"
        case .yellow:
            return "Yellow"
        case .gray:
            return "Gray"
        case .green:
            return "Green"
        }
    }
    var color: Color {
        switch self {
        case .white:
            return .white
        case .brown:
            return .brown
        case .indigo:
            return .indigo
        case .orange:
            return .orange
        case .pink:
            return .pink
        case .yellow:
            return .yellow
        case .gray:
            return .gray
        case .green:
            return .green
        }
    }
}
