//
//  SocialMediaView.swift
//  HamztWaslApp
//
//  Created by Nour Gweda on 21/02/2025.
//

import SwiftUI
import AuthenticationServices

struct SocialMediaView: View {

    var isSignUp: Bool = false

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            SeperatorView(title: isSignUp ? Constants.SignIn.orSignupWith : Constants.SignIn.orLoginWith)
                .padding(.bottom, 4)

            SignInButtonView(buttonTitle: !isSignUp ?
                             "\(Constants.SignIn.login) \(Constants.SignIn.withGoogle)" :
                                "\(Constants.SignIn.signupWith) \(Constants.SignIn.withGoogle)", buttonIcon: IconsConstants.SignInConstantsIcons.googleIC)

            SignInButtonView(buttonTitle: !isSignUp ?
                             "\(Constants.SignIn.login) \(Constants.SignIn.withFacebook)" :
                                "\(Constants.SignIn.signupWith) \(Constants.SignIn.withFacebook)", buttonIcon: IconsConstants.SignInConstantsIcons.facebookIC)

            SignInWithAppleButton(.signIn) { _ in
            } onCompletion: { result in
                switch result {
                case .success(let authResults):
                    print("Authorization successful: \(authResults)")
                case .failure(let error):
                    print("Authorization failed: \(error.localizedDescription)")
                }
            }
            .padding(2)
            .frame(maxWidth: .infinity, minHeight: 54, maxHeight: 54, alignment: .center)
            .signInWithAppleButtonStyle(.whiteOutline)
            .cornerRadius(10)
            .isHidden(isSignUp, remove: true)

            SignInWithAppleButton(.signUp) { _ in
            } onCompletion: { result in
                switch result {
                case .success(let authResults):
                    print("Authorization successful: \(authResults)")
                case .failure(let error):
                    print("Authorization failed: \(error.localizedDescription)")
                }
            }
            .padding(2)
            .frame(maxWidth: .infinity, minHeight: 54, maxHeight: 54, alignment: .center)
            .signInWithAppleButtonStyle(.whiteOutline)
            .cornerRadius(10)
            .isHidden(!isSignUp, remove: true)
        }
    }
}

#Preview {
    SocialMediaView()
}
