//
//  OTPWidget.swift
//  HamztWaslApp
//
//  Created by Nour Gweda on 22/02/2025.
//

import SwiftUI
import Combine

struct OTPWidget: View {

    @Binding var isConfirmationPresented: Bool
    @Binding var isForgetPasswordPresented: Bool
    @Binding var isPresented: Bool
    @State var verificationCode: String = ""
    @State var timeRemaining = 90
    @State var timer: AnyCancellable?

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Group {
                Text(Constants.OTP.verifyYourEmail)
                    .font(.system(size: 28, weight: .bold, design: .default))
                    .foregroundColor(.themeColors.primary)
                    .padding(.top, 60)
                
                Text(Constants.ForgetPassword.noWorries)
                    .font(.system(size: 15, weight: .regular, design: .default))
                    .foregroundColor(.themeColors.darkGrey)
            }.padding(.horizontal, 16)

            AEOTPView(text: $verificationCode,
                      slotsCount: 6,
                      width: UIScreen.main.bounds.width - 40,
                      height: 54,
                      otpBackgroundColor: UIColor(Color.themeColors.background),
                      otpFilledBackgroundColor: UIColor(Color.themeColors.background),
                      otpCornerRaduis: 10,
                      otpDefaultBorderColor: UIColor(Color.themeColors.lightGrey),
                      otpFilledBorderColor: UIColor(Color.themeColors.lightGreen),
                      otpDefaultBorderWidth: 1,
                      otpFilledBorderWidth: 1,
                      otpTextColor: UIColor(Color.themeColors.primary),
                      isSecureTextEntry: false,
                      enableClearOTP: false,
                      onCommit: {

            }).padding(.bottom, 22)
              .padding(.top, 32)
              .environment(\.layoutDirection, .leftToRight)
              .frame(maxWidth: .infinity)

            Text(timeFormatted(timeRemaining))
                .font(.system(size: 14, weight: .semibold, design: .default))
                .foregroundColor(timeFormatted(timeRemaining) == "0:00" ?
                    .themeColors.darkGrey :
                        .themeColors.lightGreen)
                .frame(maxWidth: .infinity, alignment: .center)

            HStack(spacing: 0) {
                Text(Constants.OTP.didntReceiveCode)
                    .font(.system(size: 14, weight: .regular, design: .default))
                    .foregroundColor(.themeColors.darkGrey)

                // MARK: - signup
                Button(action: {
                    timeRemaining = 90
                }, label: {
                    Text(" \(Constants.OTP.sendAgain)")
                        .font(.system(size: 14, weight: .semibold, design: .default))
                        .foregroundColor(.themeColors.lightGreen)
                })
            }.frame(maxWidth: .infinity, alignment: .center)

            Spacer()

            HamztWaslButton(title: Constants.OTP.confirm,
                            buttonAction: {
                handleOTPValidation()
            }).buttonStyle(MainButtonStyle())
                .opacity(verificationCode.isSixDigitNumber ? 1 : 0.5)
             .disabled(!verificationCode.isSixDigitNumber)
             .padding(.bottom, 28)
             .padding(.horizontal, 16)

            NavigationLink(isActive: $isConfirmationPresented) {
                OTPSuccessPlaceHolder(isConfirmationPresented: $isConfirmationPresented,
                                      isForgetPasswordPresented: $isForgetPasswordPresented,
                                      isOTPPresented: $isPresented)
                  } label: {
                    EmptyView()
                  }
        }.modifier(CustomToolbarModifier(isPresented: $isForgetPasswordPresented, isNotificationVisible: false))
        .onAppear {
            startTimer()
        }
    }
}

#Preview {
    OTPWidget(isConfirmationPresented: .constant(true),
              isForgetPasswordPresented: .constant(true),
              isPresented: .constant(true))
}
