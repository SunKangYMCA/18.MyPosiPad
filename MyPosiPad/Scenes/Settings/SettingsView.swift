//
//  SettingsView.swift
//  MyPosiPad
//
//  Created by 강성찬 on 2023-10-10.
//

import SwiftUI
import PhotosUI

struct SettingsView: View {
    
    @EnvironmentObject var mainViewModel: MainViewModel
    @EnvironmentObject var cartListManager: CartListManager
    
    var body: some View {
        VStack {
            Text("Settings")
                .font(.system(size: 72, weight: .bold))
                .bold()
            
            generalSettings
            
            Divider()
            
            paySettings
            
            Divider()
            
            productSettings
            
            Divider()
            
            resetSetting
            
        }
        .frame(width: 800)
    }
    
    private var generalSettings: some View {
        VStack {
            HStack {
                Text("General")
                    .font(.largeTitle)
                    .bold()
                    .padding()
                Spacer()
            }
            
            HStack {
          
                
                Text("ChangeColor")
                    .font(.title2)
                    .padding()
                    .background(
                        Color.gray
                            .opacity(0.2)
                            .cornerRadius(15)
                    )
                    .padding()
                Spacer()
                
                Picker("Change", selection: $mainViewModel.backGroundColor) {
                    ForEach(BackGroundColor.allCases) { item in
                        Text(item.title)
                    }
                    .bold()
                    .font(.title)
                    .background(
                        Color.gray
                            .opacity(0.5)
                            .cornerRadius(15)
                    )
                }
          
            }
            
            HStack {
      
                Text("ShopName")
                    .font(.title2)
                    .padding()
                    .background(
                        Color.gray
                            .opacity(0.2)
                            .cornerRadius(15)
                    )
                    .padding()
                Spacer()
                
                TextField("Name", text: $mainViewModel.shopName)
                    .frame(width: 100)
                    .textFieldStyle(.roundedBorder)
            
            }
            
            HStack {
           
                Text("Benner")
                    .font(.title2)
                    .padding()
                    .background(
                        Color.gray
                            .opacity(0.2)
                            .cornerRadius(15)
                    )
                    .padding()
                Spacer()
                
                PhotosPicker(selection: $mainViewModel.benner, matching: .images) {
                    Text("Change")
                        .foregroundColor(.black)
                        .font(.title2)
                        .bold()
                        .padding()
                        .background(
                            mainViewModel.bennerImage
                                .resizable()
                                .opacity(0.5)
                                .cornerRadius(15)
                        )
                }
                .onChange(of: mainViewModel.benner) {
                    Task {
                        if let selected = try? await mainViewModel.benner?.loadTransferable(type: Image.self) {
                                mainViewModel.bennerImage = selected
                            }
                    }
                }
                    
                    
                    
                
            }
        }
    }
    
    private var paySettings: some View {
        VStack {
            HStack {
                Text("Price")
                    .font(.largeTitle)
                    .bold()
                    .padding()
                Spacer()
            }
            
            HStack {
       
                Text("TaxSetting")
                    .font(.title2)
                    .padding()
                    .background(
                        Color.gray
                            .opacity(0.2)
                            .cornerRadius(15)
                    )
                    .padding()
                Spacer()
                
                Picker("Tax", selection: $cartListManager.taxRate) {
                    ForEach(TaxRate.allCases, id: \.self) { tax in
                        Text(tax.title)
                    }
                }

            }
        }
    }
    
    private var productSettings: some View {
        VStack {
            HStack {
                Text("Product")
                    .font(.largeTitle)
                    .bold()
                    .padding()
                Spacer()
            }
        }
    }
    
    private var resetSetting: some View {
        VStack {
            HStack {
                Text("ResetSettings")
                    .font(.largeTitle)
                    .bold()
                    .padding()
                Spacer()
            }
        }
    }
}
struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
