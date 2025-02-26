//
//  OTPSuccessPlaceHolder.swift
//  HamztWaslApp
//
//  Created by Nour Gweda on 22/02/2025.
//

import SwiftUI

struct OTPSuccessPlaceHolder: View {

    @Binding var isConfirmationPresented: Bool
    @Binding var isForgetPasswordPresented: Bool
    @Binding var isOTPPresented: Bool

    var body: some View {
        VStack(spacing: 12) {
            Image(IconsConstants.SignInConstantsIcons.sendEmailPlaceholder)
                .resizable()
                .frame(width: 150, height: 150)

            Text(Constants.OTP.successfullyVerified)
                .font(.system(size: 20, weight: .bold, design: .default))
                .foregroundColor(.themeColors.primary)

            VStack(spacing: 0) {
                Text("\(Constants.OTP.weHaveSentAnEmail)")
                    .font(.system(size: 15, weight: .regular, design: .default))
                    .foregroundColor(.themeColors.darkGrey)
                
                Text("'\(UserSession.shared.currentUser?.email ?? "nour.gweda@trianglz.com")'")
                    .font(.system(size: 15, weight: .semibold, design: .default))
                    .foregroundColor(.themeColors.darkGrey)
                
                Text("\(Constants.OTP.pleaseCheckYourInbox) \n \(Constants.OTP.ifYouDontSeeTheEmail)")
                    .font(.system(size: 15, weight: .regular, design: .default))
                    .foregroundColor(.themeColors.darkGrey)
            } .multilineTextAlignment(.center)

            Spacer()

            
            HamztWaslButton(title: Constants.OTP.backToLogin,
                            buttonAction: {
                isForgetPasswordPresented = false
            }).buttonStyle(MainButtonStyle())
        }.padding(.top, 90)
         .padding(.horizontal, 16)
         .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    OTPSuccessPlaceHolder(isConfirmationPresented: .constant(true),
                          isForgetPasswordPresented: .constant(true),
                          isOTPPresented: .constant(true))
}
