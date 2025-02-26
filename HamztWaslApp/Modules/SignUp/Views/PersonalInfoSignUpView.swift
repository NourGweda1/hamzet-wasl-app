//
//  PersonalInfoSignUpView.swift
//  HamztWaslApp
//
//  Created by Nour Gweda on 26/02/2025.
//

import SwiftUI

struct PersonalInfoSignUpView: View {

    @Binding var personName: String
    @Binding var email: String
    @Binding var password: String
    @Binding var isValidName: Bool
    @Binding var isValidemail: Bool
    @Binding var isValidpassword: Bool

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {

            // MARK: - name textfield
            MainTextField(mode: .custom,
                          placeHolderText: Constants.SignUp.enterFullName,
                          placeHolderLeadingIcon: IconsConstants.SignUpConstantsIcons.personIC,
                          submitLabel: .return,
                          isTextFieldDisabled: .constant(false),
                          isValidData: $isValidName,
                          bindingText: $personName)
            
            // MARK: - email textfield
            MainTextField(mode: .email,
                          placeHolderText: Constants.SignIn.enterEmailAddress,
                          submitLabel: .return,
                          isTextFieldDisabled: .constant(false),
                          isValidData: $isValidemail,
                          bindingText: $email)
            
            // MARK: - password textfield
            MainTextField(mode: .password,
                          placeHolderText: Constants.SignIn.enterPassword,
                          submitLabel: .return,
                          isTextFieldDisabled: .constant(false),
                          isValidData: $isValidpassword,
                          bindingText: $password)
        }
    }
}

#Preview {
    PersonalInfoSignUpView(personName: .constant(""),
                           email: .constant(""),
                           password: .constant(""),
                           isValidName: .constant(true),
                           isValidemail: .constant(true),
                           isValidpassword: .constant(true))
}
