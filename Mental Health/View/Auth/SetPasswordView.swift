//
//  SetPasswordView.swift
//  Mental Health
//
//  Created by bakebrlk on 06.12.2024.
//

import SwiftUI

struct SetPasswordView: View {
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @State private var isSecure: Bool = true
    @State private var passwordIsTrue: Bool? = nil
    @EnvironmentObject var router: Router
    
    private var btn: some View {
        Button(action: {
            passwordIsTrue = password == "1234"
            if passwordIsTrue! && password == confirmPassword {
                router.navigate(to: .successPage)
            }
        }, label: {
            Text("Update Password")
                .frame(maxWidth: .infinity)
                .multilineTextAlignment(.center)
                .font(.system(size: 22, weight: .medium))
                .foregroundColor(.white)
                .padding()
        })
        .background(Color("green"))
        .cornerRadius(10)
        .padding()
    }
    
    func getTextField(hint: String, tf: Binding<String>, isSecure: Binding<Bool>?) -> some View {
        
        VStack{
            HStack{
                
                Group {
                    if let isSecure = isSecure {
                        
                        if isSecure.wrappedValue {
                            SecureField(hint, text: tf)
                        }else {
                            TextField(hint, text: tf)
                        }
                    }else {
                        TextField(hint, text: tf)
                    }
                    
                }
                .keyboardType(.phonePad)
                .padding(isSecure != nil ? .leading : .trailing)
                
                
                if let isSecure = isSecure {
                    getImage(systemName: (isSecure.wrappedValue ? "eye.slash.fill" : "eye.fill"), size: 20)
                        .padding(.leading)
                        .onTapGesture {
                            isSecure.wrappedValue.toggle()
                        }
                }
            }
            .frame(maxWidth: .infinity)
            .padding()
            .overlay{
                RoundedRectangle(cornerRadius: 10)
                    .stroke(((passwordIsTrue != nil && hint == "Password") ? (passwordIsTrue! ? Color("green") : Color.red) : Color(.systemGray4)), lineWidth: 2)
            }
            .padding([.leading, .trailing])
            .cornerRadius(10)
            
            if passwordIsTrue != nil && !passwordIsTrue! && hint == "Password" {
                Text("Wrong password")
                    .foregroundColor(.red)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.system(size: 12))
                    .padding(.leading)
            }
        }
    }
    
    func getImage(named: String, size: CGFloat) -> some View {
        Image(named)
            .resizable()
            .scaledToFit()
            .frame(maxWidth: size)
            .foregroundColor(.black)
            .padding(.leading)
    }
    
    func getImage(systemName: String, size: CGFloat) -> some View {
        Image(systemName: systemName)
            .resizable()
            .scaledToFit()
            .frame(maxWidth: size)
            .foregroundColor(.gray)
            .padding(.trailing)
    }
    
    var title: some View {
        Text("Set a new password")
            .frame(maxWidth: .infinity, alignment: .leading)
            .multilineTextAlignment(.leading)
            .font(.system(size: 18, weight: .semibold))
            .foregroundColor(.black)
            .padding(.leading)
    }
    var description: some View {
        Text("Create a new password. Ensure it differs from previous ones for security")
            .frame(maxWidth: .infinity, alignment: .leading)
            .multilineTextAlignment(.leading)
            .font(.system(size: 16, weight: .regular))
            .foregroundColor(.gray)
            .padding()
    }
    
    private func getTitle(text: String) -> some View {
        Text(text)
            .frame(maxWidth: .infinity, alignment: .leading)
            .multilineTextAlignment(.leading)
            .font(.system(size: 16, weight: .regular))
            .foregroundColor(.black)
            .padding(.leading)
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
    
    var box: some View {
        VStack{
            
            backBtn
            
            title
            
            description
            
            getTitle(text: "Password")
            getTextField(hint: "Password", tf: $password, isSecure: $isSecure)
            
            getTitle(text: "Confirm Password")
                .padding(.top)
            getTextField(hint: "Re-enter  password", tf: $confirmPassword, isSecure: $isSecure)
            
            btn
            
            
            Spacer()
        }
        .frame(maxWidth: .infinity,
               maxHeight: UIScreen.main.bounds.height * 0.712)
        .background(Color.white)
        .cornerRadius(30)
    }
    
    var body: some View {
        VStack{
            box
            Spacer()
        }
        .frame(maxWidth: .infinity,
               maxHeight: .infinity)
    }
}

#Preview {
    SetPasswordView()
}
