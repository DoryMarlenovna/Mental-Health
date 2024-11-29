//
//  WelcomeView.swift
//  Mental Health
//
//  Created by bakebrlk on 29.11.2024.
//

import SwiftUI

struct WelcomeView: View {
    
    private var image: some View  {
        Image("chillGuy")
            .resizable()
            .scaledToFit()
            .frame(maxWidth: UIScreen.main.bounds.width * 0.79)
            .padding()
    }
    
    private var title: some View {
        Text("Your journey to self-care begins here.")
            .frame(maxWidth: .infinity)
            .multilineTextAlignment(.center)
            .font(.system(size: 25, weight: .medium))
            .foregroundColor(.black)
    }
    
    private var subtitle: some View {
        Text("Sign in to access tools and support to improve your life!")
            .frame(maxWidth: .infinity)
            .multilineTextAlignment(.center)
            .font(.system(size: 20, weight: .regular))
            .foregroundColor(.gray)
            .padding(.top)
    }
    
    private var btn: some View {
        Button(action: {
            
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
    
    var body: some View {
        VStack{
            Spacer()

            image
            
            title
            
            subtitle
            
            Spacer()
            
            btn
        }
    }
}

#Preview {
    WelcomeView()
}
