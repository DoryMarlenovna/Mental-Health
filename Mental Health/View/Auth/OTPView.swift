//
//  OTPView.swift
//  Mental Health
//
//  Created by bakebrlk on 04.12.2024.
//

import SwiftUI

struct OTPView: View {
    
    @ObservedObject private var vm: AuthVM = AuthVM.shared
    @EnvironmentObject var router: Router

    var body: some View {
        VStack{
            backBtn
            
            title
            
            hint
            
            OTPTextFieldView()
            
            nextBtn
            
            resentCodeBtn
            
            Spacer()
            
            signInBtn
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    private func checkCode() {
        let userCode = vm.enterValue.joined()
        
        if userCode.elementsEqual("1111") {
            vm.checkOTP = .correct
        }else{
            vm.checkOTP = .wrong
        }
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
        Text("Registration")
            .frame(maxWidth: .infinity, alignment: .leading)
            .font(.system(size: 28, weight: .semibold))
            .padding()
    }
    
    private var hint: some View {
        Group{
            Text("The code was sent to ")
                .font(.body)
            + Text("\(vm.phoneNumber)")
                .font(.system(size: 15, weight: .semibold))
            + Text(" SMS code ")
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding([.leading, .trailing])
    }
    
    private var nextBtn: some View {
        Button {
            checkCode()

            if vm.checkOTP == .correct {
                router.navigate(to: .signUp)
            }
        } label: {
            Text("Verify code")
                .padding()
                .frame(maxWidth: .infinity)
                .font(.system(size: 18, weight: .semibold))
                .foregroundColor(.white)
                .background((vm.checkOTP == .canCheck) ? Color("green") :
                                Color("green").opacity(0.7))
                .cornerRadius(10)
                .padding([.leading, .trailing, .top])
        }
    }
    
    private var resentCodeBtn: some View {
        Button {

        } label: {
            Text("Resend code")
                .padding()
                .frame(maxWidth: .infinity)
                .font(.system(size: 18, weight: .semibold))
                .foregroundColor((vm.checkOTP == .correct) ? .black : .gray)
                .padding([.leading, .trailing, .bottom])
        }
    }
    
    private var signInBtn: some View {
        Button {
            router.navigate(to: .signIN)
        } label: {
            Group {
                
                Text("Already have an account?")
                    .font(.system(size: 12, weight: .regular))
                    .foregroundStyle(Color(.systemGray3))

                Text("Sign In")
                    .foregroundColor(.black)
                    .font(.system(size: 12, weight: .semibold))
                    .onTapGesture {
                        router.navigate(to: .signUp)
                    }
                
            }
        }
    }
}

#Preview {
    OTPView()
}
