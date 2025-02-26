//
//  SignInWidget+Extension.swift
//  HamztWaslApp
//
//  Created by Nour Gweda on 22/02/2025.
//
import SwiftUI

extension SignInWidget {

    func handleLoginValidation() {
        handler.isValidData = !handler.emailText.isEmpty &&
        handler.emailText.isValidEmail &&
        !handler.passwordText.isEmpty
    }

    func loginBtnValidation() -> Bool {
        !handler.emailText.isEmpty &&
        handler.emailText.isValidEmail &&
        !handler.passwordText.isEmpty
    }

    func handleLogin() {
        DispatchQueue.main.async {
            if CoreDataManager.shared.getUser(email: handler.emailText) &&
                (UserSession.shared.currentUser?.password == handler.passwordText) {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                        isHomePresented = true
                    }
            } else {
                handler.isValidData = false
                handler.errorMessage = Constants.SignIn.invalidLogin
            }
        }
    }

    func setTextFieldsValidation(value: Bool) {
        handler.isValidEmail = value
        handler.isValidPassword = value
    }
}
