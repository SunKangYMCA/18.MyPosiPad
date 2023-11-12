//
//  UserManager.swift
//  MyPosiPad
//
//  Created by Min Kwon on 2023-11-11.
//

import SwiftUI

class UserManager: ObservableObject {
    static let EMPLOYEES: [Employee] = [
        Employee(id: "1234", initial: "SK"),
        Employee(id: "5678", initial: "EG"),
        Employee(id: "9999", initial: "MS")
    ]
    
    @AppStorage("LOGGED_EMPLOYEE") var loggedEmployee: Employee? = nil
    @Published var currentEmployee: Employee = Employee(id: "", initial: "")
    
    init() {
        if let loggedEmployee = loggedEmployee {
            currentEmployee = loggedEmployee
        }
    }
    
    var isLoggedIn: Bool {
        loggedEmployee != nil
    }
    
    func signIn(employeeID: String) {
        if let authenticatedEmplyoee = authenticate(id: employeeID) {
            currentEmployee = authenticatedEmplyoee
            loggedEmployee = authenticatedEmplyoee
        }
    }
    
    func signOut() {
        loggedEmployee = nil
        currentEmployee.id = ""
        currentEmployee.initial = ""
    }
    
    private func authenticate(id: String) -> Employee? {
        return UserManager.EMPLOYEES.first(where: { $0.id == id })
    }
}
