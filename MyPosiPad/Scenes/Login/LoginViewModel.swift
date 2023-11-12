//
//  LoginViewModel.swift
//  MyPosiPad
//
//  Created by Min Kwon on 2023-11-12.
//

import SwiftUI

class LoginViewModel: ObservableObject {
    @Published var employeeID: String = ""
    @Published var showAuthError: Bool = false
    var userManager: UserManager = UserManager()
    
    func initialize(userManager: UserManager) {
        employeeID = ""
        self.userManager = userManager
    }
    
    func onSignInTap() {
        userManager.signIn(employeeID: employeeID)
        if !userManager.isLoggedIn {
            showAuthError = true
        }
    }
    
    func onKeyPadTap() {
        showAuthError = false
    }
}
