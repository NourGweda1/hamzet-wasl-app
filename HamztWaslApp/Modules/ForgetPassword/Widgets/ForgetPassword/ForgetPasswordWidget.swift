//
//  ForgetPasswordWidget.swift
//  HamztWaslApp
//
//  Created by Nour Gweda on 22/02/2025.
//

import SwiftUI

struct ForgetPasswordWidget: View {

    @Binding var isConfirmationPresented: Bool
    @Binding var isForgetPasswordPresented: Bool
    @Binding var isOTPPresented: Bool
    @State var email: String = ""
    @State var isValidEmail: Bool = true

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(Constants.ForgetPassword.forgetYourPassword)
                .font(.system(size: 28, weight: .bold, design: .default))
                .foregroundColor(.themeColors.primary)
                .padding(.top, 40)

            Text(Constants.ForgetPassword.noWorries)
                .font(.system(size: 15, weight: .regular, design: .default))
                .foregroundColor(.themeColors.darkGrey)

            MainTextField(mode: .email,
                          placeHolderText: Constants.SignIn.enterEmailAddress,
                          submitLabel: .return,
                          isTextFieldDisabled: .constant(false),
                          isValidData: $isValidEmail,
                          bindingText: $email)
            .padding(.top, 22)

            Spacer()

            HamztWaslButton(title: Constants.ForgetPassword.verify,
                            buttonAction: {
                debugPrint(CoreDataManager.shared.getUser(email: email), "📬")
                validateEmail()
            }).buttonStyle(MainButtonStyle())
             .opacity(forgetPasswordValidation() ? 1 : 0.5)
             .disabled(!forgetPasswordValidation())

            Button {
                isForgetPasswordPresented = false
            } label: {
                Text(Constants.ForgetPassword.back)
                    .font(.system(size: 14, weight: .semibold, design: .default))
                    .foregroundColor(.black)
            }.frame(maxWidth: .infinity, minHeight: 54, maxHeight: 54, alignment: .center)
             .background(Color.themeColors.buttonBackground)
            .cornerRadius(10)
            .padding(.bottom, 28)

            NavigationLink(isActive: $isOTPPresented) {
                OTPWidget(isConfirmationPresented: $isConfirmationPresented,
                          isForgetPasswordPresented: $isForgetPasswordPresented,
                          isPresented: $isOTPPresented)
            } label: {
                EmptyView()
            }
        }.padding(.horizontal, 16)
         .modifier(CustomToolbarModifier(isPresented: $isForgetPasswordPresented, isNotificationVisible: false))
         .onChange(of: email) { _ in
             isValidEmail = true
        }
    }
}

#Preview {
    ForgetPasswordWidget(isConfirmationPresented: .constant(true),
                         isForgetPasswordPresented: .constant(true),
                         isOTPPresented: .constant(true))
}
