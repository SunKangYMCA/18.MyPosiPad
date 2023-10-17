//
//  MainTabView.swift
//  MyPosiPad
//
//  Created by 강성찬 on 2023-10-09.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        NavigationView {
            TabView {
                MainView()
                    .tabItem {
                        Label("Main", systemImage: "calendar")
                    }
                PaymentHistoryView()
                    .tabItem {
                        Label("DataLog", systemImage: "doc.text")
                    }
                PayView()
                    .tabItem {
                        Label("Pay", systemImage: "dollarsign.circle")
                    }
                SettingsView()
                    .tabItem {
                        Label("Settings", systemImage: "gear")
                    }
            }
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
