//
//  Employee.swift
//  MyPosiPad
//
//  Created by 강성찬 on 2023-10-09.
//

import SwiftUI

struct Employee: Codable {
    var id: String
    var initial: String
}

extension Optional: RawRepresentable where Wrapped: Codable {
    public var rawValue: String {
        guard let data = try? JSONEncoder().encode(self) else {
            return "{}"
        }
        return String(decoding: data, as: UTF8.self)
    }

    public init?(rawValue: String) {
        guard let value = try? JSONDecoder().decode(Self.self, from: Data(rawValue.utf8)) else {
            return nil
        }
        self = value
    }
}
