//
//  LoginView.swift
//  MyPosiPad
//
//  Created by 강성찬 on 2023-10-08.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject private var viewModel: LoginViewModel = LoginViewModel()
    @EnvironmentObject var userManager: UserManager
    
    var body: some View {
        VStack {
            if userManager.isLoggedIn {
                MainTabView()
            } else {
                VStack {
                    Text("MY POS")
                        .font(.system(size: UIScreen.main.bounds.width * 0.1, weight: .bold))
                    
                    keypadSection
                    
                    loginButton
                }
                .onAppear {
                    viewModel.initialize(userManager: userManager)
                }
            }
        }
    }
    
    private var keypadSection: some View {
        VStack {
            HStack {
                Spacer()
                Text(viewModel.employeeID)
                    .tracking(64)
                    .foregroundStyle(viewModel.showAuthError ? .red : .primary)
                Spacer()
            }
            .frame(height: 72)
            Divider()
            KeyPadView(string: $viewModel.employeeID) {
                viewModel.onKeyPadTap()
            }
        }
        .padding(.horizontal, UIScreen.main.bounds.width * 0.2)
        .font(.largeTitle)
        .padding()
    }
    
    private var loginButton: some View {
        
        Button {
            viewModel.onSignInTap()
        } label: {
            Text("Sign In")
                .font(.title)
                .padding(.vertical, 16)
                .padding(.horizontal, 32)
                .foregroundColor(.white)
                .background(
                    Color.blue
                        .opacity(0.5)
                        .blur(radius: 2)
                )
        }
        .padding()
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .environmentObject(UserManager())
    }
}
