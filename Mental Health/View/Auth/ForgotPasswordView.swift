//
//  ForgotPasswordView.swift
//  Mental Health
//
//  Created by bakebrlk on 06.12.2024.
//

import SwiftUI

struct ForgotPasswordView: View {
    @ObservedObject private var vm: AuthVM = AuthVM.shared
    @EnvironmentObject var router: Router

    var body: some View {
        VStack{
            backBtn
            
            title
            
            hint
                                    
            titlePhoneNumber
            
            textFieldPhoneNumber
            
            Spacer()
            
            sentBtn
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    private var backBtn: some View {
        HStack{
            Button(action: {
                router.navigateBack()
            }, label: {
                Image(systemName: "arrowshape.turn.up.backward")
                    .padding(12)
                    .foregroundColor(.white)
                    .background(Color("green"))
                    .cornerRadius(20)
            })
            Spacer()
        }
        .padding()
    }
    
    private var title: some View {
        Text("Forgot password")
            .frame(maxWidth: .infinity, alignment: .leading)
            .font(.system(size: 28, weight: .semibold))
            .padding()
    }
    
    private var hint: some View {
        Text("We will send a 4-digit code to your phone to confirm your identity")
            .frame(maxWidth: .infinity, alignment: .leading)
            .font(.body)
            .padding([.leading, .trailing])
    }
    
    private var titlePhoneNumber: some View {
        Text("Enter your phone number")
            .frame(maxWidth: .infinity, alignment: .leading)
            .font(.system(size: 15, weight: .semibold))
            .padding([.leading, .trailing, .top])
    }
    
    private var textFieldPhoneNumber: some View {
        TextField("+7 (7__) ___ __ __", text: $vm.phoneNumber)
            .keyboardType(.numberPad)
            .onChange(of: vm.phoneNumber) { newValue in
                vm.phoneNumber = vm.phoneNumber.formatPhoneNumber()
            }
            .font(.system(size: 20, weight: .medium))
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color("green"), lineWidth: 2)
                
            )
            .padding([.leading, .trailing, .bottom])
        
    }
    
    private var sentBtn: some View {
        Button(action: {
            router.navigate(to: .forgotOTP)
        }, label: {
            Text("Send code")
                .padding()
                .frame(maxWidth: .infinity)
                .foregroundColor(.white)
                .background(Color("green"))
                .font(.system(size: 18, weight: .semibold))
                .cornerRadius(10)
                .padding()
        })
    }
}

#Preview {
    ForgotPasswordView()
}
