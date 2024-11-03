//
//  MyPosiPadApp.swift
//  MyPosiPad
//
//  Created by 강성찬 on 2023-10-08.
//

import SwiftUI
import CoreData

@main
struct MyPos_settingpageApp: App {
    @StateObject var cartListManager: CartListManager = CartListManager()
    @StateObject var userManager: UserManager = UserManager()
    @StateObject var mainViewModel: MainViewModel = MainViewModel()
    let persistence = Persistence.shared
    
    var body: some Scene {
        WindowGroup {
            SplashView()
                .environmentObject(userManager)
                .environmentObject(mainViewModel)
                .environmentObject(cartListManager)
                .environment(\.managedObjectContext, persistence.container.viewContext)
        }
    }
}
