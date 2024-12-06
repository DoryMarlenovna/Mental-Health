//
//  PasswordResetView.swift
//  Mental Health
//
//  Created by bakebrlk on 06.12.2024.
//

import SwiftUI

struct PasswordResetView: View {
    @EnvironmentObject var router: Router

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
    
    private var titleView: some View {
        Text("Reset Password")
            .frame(maxWidth: .infinity, alignment: .leading)
            .font(.system(size: 28, weight: .semibold))
            .padding([.leading, .bottom])
    }
    
    private var descriptionView: some View {
        Text("Your password has been successfully reset. click confirm to set a new password")
            .frame(maxWidth: .infinity, alignment: .leading)
            .font(.system(size: 14, weight: .regular))
            .foregroundColor(.gray)
            .padding(.leading)
    }
    
    private var sentBtn: some View {
        Button(action: {
            router.navigate(to: .setPassword)
        }, label: {
            Text("Confirm")
                .padding()
                .frame(maxWidth: .infinity)
                .foregroundColor(.white)
                .background(Color("green"))
                .font(.system(size: 18, weight: .semibold))
                .cornerRadius(10)
                .padding()
        })
    }
    
    var body: some View {
        VStack {
            backBtn
            
            titleView
            
            descriptionView
            
            sentBtn
            
            Spacer()
        }
    }
}

#Preview {
    PasswordResetView()
}
