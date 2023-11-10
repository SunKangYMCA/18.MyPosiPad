//
//  LoggedEmployeeProfile.swift
//  MyPosiPad
//
//  Created by 강성찬 on 2023-11-07.
//

import SwiftUI

struct LoggedEmployeeProfile: View {
    
    var loggedEmployee: String
    
    var body: some View {
        ZStack {
            Color.black
                .frame(width: 50, height: 50)
                .cornerRadius(50)
                .opacity(0.5)
            
            Text(loggedEmployee)
                .foregroundColor(.white)
                .bold()
                .font(.title)
        }
    }
}

struct LoggedEmployeeProfile_Previews: PreviewProvider {
    static var previews: some View {
        LoggedEmployeeProfile(loggedEmployee: "TT")
    }
}
