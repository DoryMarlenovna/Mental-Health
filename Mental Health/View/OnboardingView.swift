//
//  OnboardingView.swift
//  Mental Health
//
//  Created by Kalmakhanbet Dariga on 15.11.2024.
//

import SwiftUI

struct OnboardingView: View {
    var body: some View {
        VStack{
            Text("Skip")
                .frame(maxWidth:.infinity,alignment: .trailing)
                .padding()
            Spacer()
            
                Text("Welcome ")
                    .foregroundColor(Color("green"))
                    .font(.largeTitle)
                    .fontWeight(.bold)
                +
                Text("to Calmind")
                    .foregroundColor(.black)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
            HStack{
                Image("onboarding")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: 255, maxHeight: 177)
                    .padding(.bottom, 90)
                
                Image("onboard")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: 255, maxHeight: 177)
                    .padding(.bottom, 90)
                
                Image("onboa")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: 255, maxHeight: 177)
                    .padding(.bottom, 90)
                
            }
        
        }
    }
    }
    

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
