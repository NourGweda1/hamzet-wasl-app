//
//  SignUpWidget+Extension.swift
//  HamztWaslApp
//
//  Created by Nour Gweda on 24/02/2025.
//

import Foundation

extension SignUpWidget {

    func saveUser() {
        if isValidSignUp() {
            CoreDataManager.shared.saveUser(id: Int64(UUID().uuidString.hashValue),
                                            name: handler.personName,
                                            email: handler.email,
                                            password: handler.password,
                                            otp: "111977",
                                            image: IconsConstants.HomeIconsConstants.profileIC)
        }

    }

    func isValidSignUp() -> Bool {
        !handler.personName.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty &&
        !handler.email.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty &&
        handler.email.isValidEmail &&
        !handler.password.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty &&
        !handler.country.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty &&
        !handler.languages.isEmpty &&
        !handler.profession.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
}
