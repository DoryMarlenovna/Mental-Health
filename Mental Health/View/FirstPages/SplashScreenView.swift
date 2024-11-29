//
//  SplashScreenView.swift
//  Mental Health
//
//  Created by Kalmakhanbet Dariga on 15.11.2024.
//

import SwiftUI

struct SplashScreenView: View {
    
    @State private var isActive = false
    
    var body: some View {
        VStack{
            if isActive {
                OnboardingView()
            }else {
                Image("splash")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: 255, maxHeight: 177)
                    .padding(.bottom, 90)
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                withAnimation {
                    isActive = true
                }
            }
        }
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
