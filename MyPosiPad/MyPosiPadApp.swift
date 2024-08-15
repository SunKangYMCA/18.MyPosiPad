//
//  MyPosiPadApp.swift
//  MyPosiPad
//
//  Created by 강성찬 on 2023-10-08.
//

import SwiftUI

@main
struct MyPos_settingpageApp: App {
    @StateObject var cartListManager: CartListManager = CartListManager()
    @StateObject var userManager: UserManager = UserManager()
    @StateObject var mainViewModel: MainViewModel = MainViewModel()
    var body: some Scene {
        WindowGroup {
            SplashView()
                .environmentObject(userManager)
                .environmentObject(mainViewModel)
                .environmentObject(cartListManager)
        }
    }
}
