//
//  SignInWidget+Handler.swift
//  HamztWaslApp
//
//  Created by Nour Gweda on 22/02/2025.
//

import Foundation

extension SignInWidget {

    @MainActor
    class Handler: ObservableObject {
    
        @Published var emailText: String = ""
        @Published var isValidEmail: Bool = true
        @Published var passwordText: String = ""
        @Published var isValidPassword: Bool = true
        @Published var isValidData: Bool = true
        @Published var errorMessage: String = ""

    }
}
