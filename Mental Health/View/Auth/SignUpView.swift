//
//  SignUpView.swift
//  Mental Health
//
//  Created by bakebrlk on 06.12.2024.
//

import SwiftUI

struct SignUpView: View {
    @State private var phone: String = ""
    @State private var password: String = ""
    @State private var confPassword: String = ""
    @State private var isSecure: Bool = true
    @State private var passwordIsTrue: Bool? = nil
    @State private var checkAgree: Bool = false
    @EnvironmentObject var router: Router
    
    private var images: [String] = ["google", "apple", "facebook"]
    
    private var signInWith: some View {
        HStack {
            ForEach(images, id: \.self) { image in
                getImage(named: image, size: 35)
            }
        }
    }

    
    private var btn: some View {
        Button(action: {
            passwordIsTrue = password == "1234"
            
            if passwordIsTrue! && password == confPassword {
                router.navigate(to: .bookView)
            }
        }, label: {
            Text("Sign Up")
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
    
    func getTextField(hint: String, tf: Binding<String>, isSecure: Binding<Bool>?) -> some View {
        
        VStack{
            HStack{
                
                if isSecure != nil {
                    getImage(systemName: "lock.fill", size: 12)
                        .padding(.leading)
                }else {
                    getImage(systemName: "person.fill", size: 15)
                        .padding(.leading)
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
        Text("Hello!")
            .frame(maxWidth: .infinity)
            .multilineTextAlignment(.center)
            .font(.system(size: 28, weight: .semibold))
            .foregroundColor(.black)
            .padding(.top, 30)
    }
    
    var agreeView: some View {
        Button {
            withAnimation{
                checkAgree.toggle()
            }
        } label: {
            HStack {
                
                ZStack{
                    if checkAgree {
                        getImage(systemName: "checkmark", size: 12)
                            .padding(.leading)
                    }
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(lineWidth: 1)
                        .frame(maxWidth: 20, maxHeight: 20)
                        .foregroundColor(.gray)
                }
                
                Text("I agree to all the")
                    .font(.system(size: 16))
                    .foregroundColor(.gray)
                
                Spacer()
            }
            .padding(.leading)
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

    
    var box: some View {
        VStack{
            title
            Spacer()
            getTextField(hint: "Login", tf: $phone, isSecure: nil)
            getTextField(hint: "Password", tf: $password, isSecure: $isSecure)
            getTextField(hint: "Re-enter  password", tf: $confPassword, isSecure: $isSecure)
            
            agreeView
                        
            btn
            
            orText
            
            signInWith
            
            Spacer()

            
            Spacer()
        }
        .frame(maxWidth: .infinity,
               maxHeight: UIScreen.main.bounds.height * 0.712)
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
    SignUpView()
}
