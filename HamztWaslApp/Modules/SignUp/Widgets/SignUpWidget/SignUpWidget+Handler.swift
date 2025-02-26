//
//  SignUpWidget+Handler.swift
//  HamztWaslApp
//
//  Created by Nour Gweda on 24/02/2025.
//

import Foundation

extension SignUpWidget {

    @MainActor
    class Handler: ObservableObject {
        @Published var personName: String = ""
        @Published var email: String = ""
        @Published var password: String = ""
        @Published var country: String = ""
        @Published var languages: [String] = []
        @Published var profession: String = ""
        @Published var languagesString: String = ""
        @Published var isValidName: Bool = true
        @Published var isValidemail: Bool = true
        @Published var isValidpassword: Bool = true
        @Published var isValidcountry: Bool = true
        @Published var isValidlanguages: Bool = true
        @Published var isValidProfession: Bool = true

    }
}
