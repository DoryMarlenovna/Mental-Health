//
//  OTPTextFieldView.swift
//  Mental Health
//
//  Created by bakebrlk on 04.12.2024.
//

import SwiftUI

struct OTPTextFieldView: View {
    
    @ObservedObject private var vm: AuthVM = AuthVM.shared
    @FocusState public var fieldFocus: Int?

    let textBoxWidth = UIScreen.main.bounds.width / 8
    let textBoxHeight = UIScreen.main.bounds.width / 8
    let paddingOfBox: CGFloat = 1
    let spaceBetweenBoxes: CGFloat = 16

    var body: some View {
        HStack(spacing: spaceBetweenBoxes){
            ForEach(0..<4, id: \.self){ index in
                textField(i: index)
            }
        }
        .padding()
    }
    
    private func textField(i: Int) -> some View {
        TextField("", text: $vm.enterValue[i])
            .font(.system(size: 32, weight: .medium))
                        .frame(width: textBoxWidth, height: textBoxHeight)
                        .foregroundColor(.black)
                        .padding([.top, .bottom])
                        .padding([.leading, .trailing], 6)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke((vm.checkOTP == .wrong ? Color.red : Color.green), lineWidth: 2)
                        )
                        .background(Color("green").opacity(0.4))
                        .multilineTextAlignment(.center)
                        .keyboardType(.numberPad)
                        .cornerRadius(10)
                        .padding(paddingOfBox)
                        .focused($fieldFocus, equals: i)
                        .tag(i)
                        .onChange(of: vm.enterValue[i]) {newValue in
                            
                            suffixValueForField(i: i)
                            
                            if !newValue.isEmpty {
                                nextField()
                            }else {
                                backField()
                            }
                        }
            
    }
    
    private func suffixValueForField(i: Int) {
        if vm.enterValue[i].count > 1{
            vm.enterValue[i] = String(vm.enterValue[i].suffix(1))
        }
    }
    
    private func nextField() {
        if fieldFocus == 3 {
            fieldFocus = nil
            vm.checkOTP = .canCheck
        }else{
            fieldFocus = (fieldFocus ?? 0) + 1
            vm.checkOTP = .notCheck
        }
    }
    
    private func backField() {
        vm.checkOTP = .notCheck
        if fieldFocus == 0 {
            fieldFocus = nil
        }else{
            fieldFocus = (fieldFocus ?? 0) - 1
        }
    }
    
    
}

#Preview {
    OTPTextFieldView()
}
