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
            
//            Group {
//                Text("Welcome ")
//                    .foregroundColor(Color("green"))
//                    .font(.largeTitle)
//                    .fontWeight(.bold)
//                +
//                Text("to Calmind")
//                    .foregroundColor(.black)
//                    .font(.largeTitle)
//                    .fontWeight(.bold)
//            }
//            .padding()
//            
            CarouselView(items: [
                OnBordingModel(title: "Welcome to Calmind!",
                               imageName: "onboarding"),
                OnBordingModel(title: "We're here to help you take care of your mental health",
                               imageName: "onboard"),
                OnBordingModel(title: "Find out how we can support you",
                               imageName: "onboa")
            ])
            
            
            Spacer()
            
            Text("Calmind")
                .font(.system(size: 22, weight: .bold))
            
        }
    }
}


struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
