//
//  LoginViewModel.swift
//  MyPosiPad
//
//  Created by 강성찬 on 2023-10-09.
//

import Foundation
import SwiftUI

class LoginViewModel: ObservableObject {
    
    @AppStorage("USER_KEY") var userInitial = ""
    
    @Published var shouldShowMainTabView: Bool = true
    @Published var employee: Employee = Employee(initial: "", passcode: "")
//    @Published var employees: [Employee] = [
//        Employee(initial: "SK", passcode: "0001"),
//        Employee(initial: "EG", passcode: "0002"),
//        Employee(initial: "MS", passcode: "0003")
//    ]
    var userDefaultsManager = UserDefaultsManager.shared
    
    private var passcodes = ["0001", "0002", "0003"]
    
    func showMainTabView() {
            if employee.passcode == "0001" {
                employee.initial = "SK"
                shouldShowMainTabView = true
                userDefaultsManager.isEmployeeLogged = true
            }
            if employee.passcode == "0002" {
                employee.initial = "EG"
                shouldShowMainTabView = true
                userDefaultsManager.isEmployeeLogged = true
            }
            if employee.passcode == "0003" {
                employee.initial = "MS"
                shouldShowMainTabView = true
                userDefaultsManager.isEmployeeLogged = true
            }
            userInitial = employee.initial
            print(employee.initial, userInitial)
        }
    
    
    func isSignOut() {
        userDefaultsManager.isEmployeeLogged = false
        shouldShowMainTabView = false
        userInitial = ""
        employee.passcode = ""
    }
}
