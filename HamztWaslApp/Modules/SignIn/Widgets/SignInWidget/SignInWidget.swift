//
//  SignInWidget.swift
//  HamztWaslApp
//
//  Created by Nour Gweda on 22/02/2025.
//

import SwiftUI

struct SignInWidget: View {

    @EnvironmentObject var userSession: UserSession
    @StateObject var handler = Handler()
    @State var shouldShowAnimation: Bool = false
    @State var shouldShowErrorAnimation: Bool = false
    @State var isHomePresented: Bool = false
    @State var isForgetPasswordPresented: Bool = false
    @State var isOTPPresented: Bool = false
    @State var isConfirmationPresented: Bool = false
    @State var isSignUpPresented: Bool = false

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            
            VStack {
                Spacer()

                SignInHeaderView()
                    .offset(y: shouldShowAnimation ? 0 : -20)
                    .animation(.easeInOut(duration: 0.5), value: shouldShowAnimation)
                    .onAppear {
                        shouldShowAnimation = true
                    }
                    .onDisappear {
                        shouldShowAnimation = false
                    }

                ErrorView(errorText: Constants.SignIn.emailOrPasswordAreIncorrect)
                    .opacity(shouldShowErrorAnimation ? 1 : 0)
                    .offset(y: shouldShowErrorAnimation ? 0 : -20)
                    .animation(.easeInOut(duration: 0.5), value: shouldShowErrorAnimation)
                    .onAppear {
                        shouldShowErrorAnimation = true
                    }
                    .onDisappear {
                        shouldShowErrorAnimation = false
                    }
                    .isHidden(handler.isValidData, remove: true)
            }.frame(height: 250)

            // MARK: - email textfield
            MainTextField(mode: .email,
                          placeHolderText: Constants.SignIn.enterEmailAddress,
                          submitLabel: .return,
                          isTextFieldDisabled: .constant(false),
                          isValidData: $handler.isValidEmail,
                          bindingText: $handler.emailText)

            // MARK: - password textfield
            MainTextField(mode: .password,
                          placeHolderText: Constants.SignIn.enterPassword,
                          submitLabel: .return,
                          isTextFieldDisabled: .constant(false),
                          isValidData: $handler.isValidPassword,
                          bindingText: $handler.passwordText)

            // MARK: - forget password
            HStack {
                Spacer()
                NavigationLink(isActive: $isForgetPasswordPresented) {
                    ForgetPasswordWidget(isConfirmationPresented: $isConfirmationPresented,
                                         isForgetPasswordPresented: $isForgetPasswordPresented,
                                         isOTPPresented: $isOTPPresented)
                } label: {
                    Button {
                        isForgetPasswordPresented = true
                    } label: {
                        Text(Constants.SignIn.forgetPassword)
                            .font(.system(size: 14, weight: .semibold, design: .default))
                            .foregroundColor(.themeColors.lightGreen)
                            .padding(.top, -6)
                    }.padding(.bottom, 40)
                }
            }

            HStack(spacing: 0) {
                Text(Constants.SignIn.didntHaveAnAccount)
                    .font(.system(size: 14, weight: .regular, design: .default))
                    .foregroundColor(.themeColors.darkGrey)

                // MARK: - signup
                
                NavigationLink(isActive: $isSignUpPresented) {
                    SignUpWidget(isPresented: $isSignUpPresented)
                } label: {
                    Button(action: {
                        isSignUpPresented = true
                    }, label: {
                        Text(" \(Constants.SignIn.signUp)")
                            .font(.system(size: 14, weight: .semibold, design: .default))
                            .foregroundColor(.themeColors.lightGreen)
                    })
                }
            }.frame(maxWidth: .infinity, alignment: .center)

            // MARK: - Login button
            HamztWaslButton(title: Constants.SignIn.login,
                            buttonAction: {
                debugPrint(CoreDataManager.shared.getUser(email: handler.emailText), "📬")
                handleLogin()
            }).buttonStyle(MainButtonStyle())
              .opacity(loginBtnValidation() ? 1 : 0.5)
              .disabled(!loginBtnValidation())

            // MARK: - social media buttons
            SocialMediaView(isSignUp: false)

        }.padding(.horizontal, 16)
         .background(Color.white)
         .onChange(of: handler.isValidData) { newValue in
             shouldShowAnimation = newValue
             shouldShowErrorAnimation = !newValue
             if !newValue {
                 setTextFieldsValidation(value: false)
             }
         }.onChange(of: handler.emailText) { _ in
             setTextFieldsValidation(value: true)
         }.onChange(of: handler.passwordText) { _ in
             setTextFieldsValidation(value: true)
         }.fullScreenCover(isPresented: $isHomePresented) {
             CustomNavigationView {
                 HomeWidget()
                     .frame(maxWidth: .infinity, maxHeight: .infinity)
             }.navigationViewStyle(.stack)
         }.overlay {
             ResultView(resultMessage: $handler.errorMessage, mode: .error)
         }
    }
}

#Preview {
    SignInWidget()
}
