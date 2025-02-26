//
//  SignUpWidget.swift
//  HamztWaslApp
//
//  Created by Nour Gweda on 24/02/2025.
//

import SwiftUI

struct SignUpWidget: View {

    @Binding var isPresented: Bool
    @StateObject var handler = Handler()

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: 12) {
                Text(Constants.SignUp.createNewAccount)
                    .font(.system(size: 28, weight: .bold, design: .default))
                    .foregroundColor(.themeColors.primary)
                    .padding(.top, 40)
                
                Text(Constants.SignUp.unlockExclusivePrivilige)
                    .font(.system(size: 15, weight: .regular, design: .default))
                    .foregroundColor(.themeColors.darkGrey)
                    .padding(.bottom, 12)
                
                PersonalInfoSignUpView(personName:  $handler.personName,
                                       email: $handler.email,
                                       password: $handler.password,
                                       isValidName: $handler.isValidName,
                                       isValidemail: $handler.isValidemail,
                                       isValidpassword: $handler.isValidpassword)
                .padding(.bottom, 8)
                
                GeneralInfoSignUpView(country: $handler.country,
                                      languages: $handler.languages,
                                      profession: $handler.profession,
                                      languagesString: $handler.languagesString,
                                      isValidcountry: $handler.isValidcountry,
                                      isValidlanguages: $handler.isValidlanguages,
                                      isValidProfession: $handler.isValidProfession)
                
                HStack(spacing: 0) {
                    Text(Constants.SignUp.alreadyHaveAccount)
                        .font(.system(size: 14, weight: .regular, design: .default))
                        .foregroundColor(.themeColors.darkGrey)
                    
                    // MARK: - signup
                    Button(action: {
                        isPresented = false
                    }, label: {
                        Text(" \(Constants.SignUp.login)")
                            .font(.system(size: 14, weight: .semibold, design: .default))
                            .foregroundColor(.themeColors.lightGreen)
                    })
                }.frame(maxWidth: .infinity, alignment: .center)
                 .padding(.top, 28)

                // MARK: - Login button
                HamztWaslButton(title: Constants.SignIn.signUp,
                                buttonAction: {
                    saveUser()
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                        isPresented = false
                    }
                }).buttonStyle(MainButtonStyle())
                  .opacity(isValidSignUp() ? 1 : 0.5)
                  .disabled(!isValidSignUp())
                
                SocialMediaView(isSignUp: true)
                    .padding(.top, 28)
                
            }.padding(.horizontal, 16)
            .modifier(CustomToolbarModifier(isPresented: $isPresented, isNotificationVisible: false))
        }
    }
}

#Preview {
    SignUpWidget(isPresented: .constant(true))
}
