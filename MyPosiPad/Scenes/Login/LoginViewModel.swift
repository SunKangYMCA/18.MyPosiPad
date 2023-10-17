//
//  LoginViewModel.swift
//  MyPosiPad
//
//  Created by 강성찬 on 2023-10-09.
//

import Foundation

class LoginViewModel: ObservableObject {
    
    @Published var employee: Employee = Employee(initial: "", passcode: "")
    @Published var shouldShowMainTabView: Bool = false
    
    private var samplePasscode = "0001"

    private var passcodes = ["0001", "0002"]
    
    func showMainTabView() {
        if passcodes.contains(employee.passcode) {
            shouldShowMainTabView.toggle()
        } else {
            employee.passcode = ""
        }
    }
}
