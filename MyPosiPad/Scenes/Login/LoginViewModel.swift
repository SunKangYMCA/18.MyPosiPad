//
//  LoginViewModel.swift
//  MyPosiPad
//
//  Created by 강성찬 on 2023-10-09.
//

import Foundation
import SwiftUI

class LoginViewModel: ObservableObject {
    
    @AppStorage("USER_KEY") var userInitial = "SK"
    
    @Published var loggedUser: String = ""
    @Published var shouldShowMainTabView: Bool = false
    @Published var employee: Employee = Employee(initial: "", passcode: "")
//    @Published var employees: [Employee] = [
//        Employee(initial: "SK", passcode: "0001"),
//        Employee(initial: "EG", passcode: "0002"),
//        Employee(initial: "MS", passcode: "0003")
//    ]
    var userDefaultsManager = UserDefaultsManager.shared
    
    private var passcodes = ["0001", "0002", "0003"]
    
    func showMainTabView() {
        if passcodes.contains(employee.passcode) {
            shouldShowMainTabView.toggle()
            userDefaultsManager.isUserLogged.toggle()
            if employee.passcode == "0001" {
                employee.initial = "SK"
            }
            if employee.passcode == "0002" {
                employee.initial = "EG"
            }
            if employee.passcode == "0003" {
                employee.initial = "MS"
            }
            loggedUser = employee.initial
        } else {
            employee.passcode = ""
        }
    }
    
    func isSignOut() {
        userDefaultsManager.isUserLogged.toggle()
        loggedUser = ""
        employee.passcode = ""
    }
}
