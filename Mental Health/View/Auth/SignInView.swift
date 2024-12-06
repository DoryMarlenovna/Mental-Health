//
//  SignUpView.swift
//  Mental Health
//
//  Created by bakebrlk on 29.11.2024.
//

import SwiftUI

struct SignInView: View {
    @EnvironmentObject var router: Router

    @State private var phone: String = ""
    @State private var password: String = ""
    @State private var isSecure: Bool = true
    @State private var passwordIsTrue: Bool? = nil
    
    private var signUp: some View {
        HStack {
            Text("Don’t have an account")
                .foregroundColor(.gray)
            
            Text("Sign Up")
                .foregroundColor(.black)
                .onTapGesture {
                    router.navigate(to: .phoneReg)
                }
        }
        .font(.system(size: 12, weight: .medium))
    }
    
    private var images: [String] = ["google", "apple", "facebook"]
    
    private var signInWith: some View {
        HStack {
            ForEach(images, id: \.self) { image in
                getImage(named: image, size: 35)
            }
        }
    }
    
    private var orText: some View {
        HStack{
            RoundedRectangle(cornerRadius: 1)       
                .stroke(Color.gray, lineWidth: 1)
                .frame(maxWidth: .infinity, maxHeight: 1)
                .padding(.leading)
            
            Text("or")
                .padding([.leading, .trailing])
            
            RoundedRectangle(cornerRadius: 1)
                .stroke(Color.gray, lineWidth: 1)
                .frame(maxWidth: .infinity, maxHeight: 1)
                .padding(.trailing)
        }
    }
    
    private var btn: some View {
        Button(action: {
            passwordIsTrue = password == "1234"
            
            if passwordIsTrue! {
                router.navigate(to: .bookView)
            }
        }, label: {
            Text("Sign In")
                .frame(maxWidth: .infinity)
                .multilineTextAlignment(.center)
                .font(.system(size: 22, weight: .medium))
                .foregroundColor(.white)
                .padding()
        })
        .background(Color("green"))
        .cornerRadius(25)
        .padding()
    }
    
    private var forgotPassword: some View {
        Text("Forgot Password?")
            .frame(maxWidth: .infinity, alignment: .trailing)
            .multilineTextAlignment(.center)
            .font(.system(size: 16, weight: .medium))
            .foregroundColor(.black)
            .padding(.trailing)
            .onTapGesture {
                router.navigate(to: .forgotPassword)
            }
    }
    
    func getTextField(hint: String, tf: Binding<String>, isSecure: Binding<Bool>?) -> some View {
        
        VStack{
            HStack{
                
                if isSecure != nil {
                    getImage(systemName: "lock.fill", size: 12)
                        .padding(.leading)
                }else {
                    getImage(named: "kz", size: 25)
                    getImage(systemName: "chevron.down", size: 10)
                }
                
                Spacer()
                
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
                RoundedRectangle(cornerRadius: 50)
                    .stroke(((passwordIsTrue != nil && hint == "Password") ? (passwordIsTrue! ? Color("green") : Color.red) : Color.gray), lineWidth: 2)
            }
            .padding()
            .cornerRadius(50)
            
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
        Text("Welcome Back!")
            .frame(maxWidth: .infinity)
            .multilineTextAlignment(.center)
            .font(.system(size: 28, weight: .semibold))
            .foregroundColor(.black)
            .padding(.top, 30)
    }
    
    var box: some View {
        VStack{
            title
            Spacer()
            getTextField(hint: "Phone number", tf: $phone, isSecure: nil)
            getTextField(hint: "Password", tf: $password, isSecure: $isSecure)
            
            forgotPassword
            
            btn
            
            orText
            
            signInWith
            
            Spacer()

            signUp
            
            Spacer()
        }
        .frame(maxWidth: .infinity,
               maxHeight: UIScreen.main.bounds.height * 0.7)
        .background(Color.white)
        .cornerRadius(30)
    }
    
    var body: some View {
        VStack{
            Spacer()
            
            box
        }
        .ignoresSafeArea()
        .frame(maxWidth: .infinity,
               maxHeight: .infinity)
        .background(Color("green"))
    }
}

#Preview {
    SignInView()
}
