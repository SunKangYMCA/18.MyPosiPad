//
//  LoginView.swift
//  MyPosiPad
//
//  Created by 강성찬 on 2023-10-08.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var viewModel: LoginViewModel = LoginViewModel()
    
    var body: some View {
        VStack {
            Text("Employee Pass Code")
                .font(.system(size: UIScreen.main.bounds.width * 0.1, weight: .bold))
            
            employeePassCodeField
            
            loginButton
                .fullScreenCover(isPresented: $viewModel.shouldShowMainTabView) {
                    MainTabView()
                }
        }
    }
    
    private var employeePassCodeField: some View {
        
        TextField("passcode", text: $viewModel.employee.passcode, prompt: Text("EmployCode 4 digits, ex) 0001"))
            .padding(30)
            .background(
                Color.green
                    .opacity(0.2)
                    .cornerRadius(15)
                    .shadow(radius: 5)
            )
            .padding([.leading, .trailing], 200)
            .keyboardType(.phonePad)
    }
    
    private var loginButton: some View {
        
        Button {
            viewModel.showMainTabView()
        } label: {
            Text("***Login***")
                .font(.title)
                .padding()
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
    }
}
