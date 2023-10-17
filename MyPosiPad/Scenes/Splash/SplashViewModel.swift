//
//  SplashViewModel.swift
//  MyPosiPad
//
//  Created by 강성찬 on 2023-10-08.
//

import Foundation

class SplashViewModel: ObservableObject {
    @Published var shouldShowLoginView: Bool = false
    
    func showLoginView() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.shouldShowLoginView = true
        }
    }
}
