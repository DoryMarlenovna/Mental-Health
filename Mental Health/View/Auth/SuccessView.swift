//
//  SuccessView.swift
//  Mental Health
//
//  Created by bakebrlk on 06.12.2024.
//

import SwiftUI

struct SuccessView: View {
    @EnvironmentObject var router: Router

    var image: some View {
        Image("success")
            .resizable()
            .scaledToFit()
            .frame(maxWidth: UIScreen.main.bounds.width/6)
    }
    
    var title: some View {
        Text("Successful")
            .font(.system(size: 19, weight: .medium))
        
    }
    
    var description: some View {
        Text("Congratulations! Your password has been changed. Click continue to login")
            .font(.system(size: 19, weight: .regular))
            .foregroundStyle(Color(.systemGray))
            .frame(maxWidth: .infinity, alignment: .center)
            .multilineTextAlignment(.center)
            .padding()
        
    }
    
    private var btn: some View {
        Button(action: {
            router.navigate(to: .signIN)
        }, label: {
            Text("Sign in")
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
    
    var body: some View {
        VStack {
            image
            
            title
            
            description
            
            btn
        }
    }
}

#Preview {
    SuccessView()
}
