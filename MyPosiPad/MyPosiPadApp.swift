//
//  MyPosiPadApp.swift
//  MyPosiPad
//
//  Created by 강성찬 on 2023-10-08.
//

import SwiftUI

@main
struct MyPosiPadApp: App {
    @StateObject var loggedInformation: LoginViewModel = LoginViewModel()
    var body: some Scene {
        WindowGroup {
            SplashView()
                .environmentObject(loggedInformation)
        }
    }
}
