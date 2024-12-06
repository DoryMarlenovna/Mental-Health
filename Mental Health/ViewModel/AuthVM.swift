//
//  AuthVM.swift
//  Mental Health
//
//  Created by bakebrlk on 04.12.2024.
//

import SwiftUI

final class AuthVM: ObservableObject {
    
    @ObservedObject public static var shared: AuthVM = AuthVM()
    
    private init() {}
        
    @Published public var phoneNumber: String = "+7 (7__)___-__-__"
        
    @Published public var enterValue: [String] = ["","","",""]
    
    @Published public var checkOTP: OTPEnum = .notCheck
}
