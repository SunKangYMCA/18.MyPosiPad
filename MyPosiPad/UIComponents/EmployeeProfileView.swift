//
//  LoggedEmployeeProfile.swift
//  MyPosiPad
//
//  Created by 강성찬 on 2023-11-07.
//

import SwiftUI

struct EmployeeProfileView: View {
    
    var employee: Employee
    
    var body: some View {
        ZStack {
            Color.black
                .frame(width: 50, height: 50)
                .cornerRadius(50)
                .opacity(0.5)
            
            Text(employee.initial)
                .foregroundColor(.white)
                .bold()
                .font(.title)
        }
    }
}

struct EmployeeProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EmployeeProfileView(employee: Employee(id: "1234", initial: "Test"))
    }
}
