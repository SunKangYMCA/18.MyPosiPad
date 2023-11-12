//
//  KeyPadView.swift
//  MyPosiPad
//
//  Created by Min Kwon on 2023-11-11.
//

import SwiftUI

struct KeyPadView: View {
    @Binding var string: String
    var onChange: () -> ()

    var body: some View {
        VStack {
            KeyPadRow(keys: ["1", "2", "3"])
            KeyPadRow(keys: ["4", "5", "6"])
            KeyPadRow(keys: ["7", "8", "9"])
            KeyPadRow(keys: ["", "0", "⌫"])
        }.environment(\.keyPadButtonAction, self.keyWasPressed(_:))
    }

    private func keyWasPressed(_ key: String) {
        onChange()
        switch key {
        case "⌫":
            if !string.isEmpty {
                string.removeLast()
            }
        case _ where string == "0": string = key
        default: string += key
        }
    }
}

struct KeyPadRow: View {
    var keys: [String]

    var body: some View {
        HStack {
            ForEach(keys, id: \.self) { key in
                KeyPadButton(key: key)
            }
        }
    }
}

struct KeyPadButton: View {
    var key: String

    var body: some View {
        Button(action: { self.action(self.key) }) {
            Color.clear
                .overlay(RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.accentColor))
                .overlay(Text(key))
        }
    }

    enum ActionKey: EnvironmentKey {
        static var defaultValue: (String) -> Void { { _ in } }
    }

    @Environment(\.keyPadButtonAction) var action: (String) -> Void
}

extension EnvironmentValues {
    var keyPadButtonAction: (String) -> Void {
        get { self[KeyPadButton.ActionKey.self] }
        set { self[KeyPadButton.ActionKey.self] = newValue }
    }
}
