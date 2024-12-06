//
//  OTPEnum.swift
//  Mental Health
//
//  Created by bakebrlk on 04.12.2024.
//

import SwiftUI

enum OTPEnum{
    case correct
    case wrong
    case notCheck
    case canCheck
    
    public func getColor() -> Color {
        switch self {
        case .correct:
            Color.green
        case .wrong:
            Color.red
        case .notCheck:
            Color("green")
        case .canCheck:
            Color("green")
        }
    }
}
