//
//  Router.swift
//  Mental Health
//
//  Created by bakebrlk on 06.12.2024.
//

import SwiftUI

final class Router: ObservableObject {
    
    public enum Destination: Codable, Hashable {
        case bookView
        case splashScreen
        case onBording
        case signIN
        case signUp
        case phoneReg
        case forgotPassword
        case welcome
        case phoneOTP
        case forgotOTP
        case passwordReset
        case setPassword
        case successPage
        @ViewBuilder
        var view: some View {
            switch self {
            case .successPage:
                SuccessView()
                    .navigationBarBackButtonHidden()
            case .setPassword:
                SetPasswordView()
                    .navigationBarBackButtonHidden()
            case .passwordReset:
                PasswordResetView()
                    .navigationBarBackButtonHidden()
            case .forgotOTP:
                ForgotOTPView()
                    .navigationBarBackButtonHidden()
            case .phoneOTP:
                OTPView()
                    .navigationBarBackButtonHidden()
            case .welcome :
                WelcomeView()
                    .navigationBarBackButtonHidden()
            case .bookView:
                BooksView()
                    .navigationBarBackButtonHidden()
            case .splashScreen:
                SplashScreenView()
                    .navigationBarBackButtonHidden()
            case .onBording:
                OnboardingView()
                    .navigationBarBackButtonHidden()
            case .signIN:
                SignInView()
                    .navigationBarBackButtonHidden()
            case .signUp:
                SignUpView()
                    .navigationBarBackButtonHidden()
            case .phoneReg:
                PhoneRegistarationView()
                    .navigationBarBackButtonHidden()
            case .forgotPassword:
                ForgotPasswordView()
                    .navigationBarBackButtonHidden()
            }
        }
    }
    
    @Published var navPath = NavigationPath()
    
    func navigate(to destination: Destination) {
        navPath.append(destination)
    }
    
    func navigateBack() {
        navPath.removeLast()
    }
    
    func navigateToRoot() {
        navPath.removeLast(navPath.count)
    }
}
