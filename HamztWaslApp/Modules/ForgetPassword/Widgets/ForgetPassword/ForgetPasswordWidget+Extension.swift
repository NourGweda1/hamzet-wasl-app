//
//  ForgetPasswordWidget+Extension.swift
//  HamztWaslApp
//
//  Created by Nour Gweda on 22/02/2025.
//

extension ForgetPasswordWidget {

    func forgetPasswordValidation() -> Bool {
        email.isValidEmail && !email.isEmpty
    }

    func validateEmail() {
        if CoreDataManager.shared.getUser(email: email) {
            isOTPPresented = true 
        } else {
            isValidEmail = false
        }
    }
}
