//
//  Employee.swift
//  MyPosiPad
//
//  Created by 강성찬 on 2023-10-09.
//

import Foundation

struct Employee: Identifiable {
    var id: UUID = UUID()
    var initial: String
    var passcode: String
}
