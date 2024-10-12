//
//  SplashView.swift
//  MyPosiPad
//
//  Created by 강성찬 on 2023-10-08.
//

import SwiftUI

struct SplashView: View {
    
    @StateObject var viewModel: SplashViewModel = SplashViewModel()
    
    var body: some View {

            VStack {
                if viewModel.shouldShowLoginView {
                        LoginView()
                } else {
                    HStack {
                        Text("POS")
                            .font(.system(size: UIScreen.main.bounds.width * 0.3, weight: .bold))
                            .foregroundColor(.blue)
                            .shadow(radius: 5)
                        Spacer()
                    }
                    
                    HStack {
                        Spacer()
                        Text("<My POS>")
                            .font(.system(size: UIScreen.main.bounds.width * 0.15, weight: .heavy))
                            .foregroundColor(.blue)
                            .shadow(radius: 5)
                    }
                }
            }
            .padding()
            .onAppear {
                viewModel.showLoginView()
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
            .environmentObject(UserManager())
    }
}
