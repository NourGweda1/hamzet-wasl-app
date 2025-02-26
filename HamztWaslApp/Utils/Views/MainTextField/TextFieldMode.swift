//
//  TextFieldMode.swift
//  HamztWaslApp
//
//  Created by Nour Gweda on 14/02/2025.
//

import SwiftUI

enum TextFieldMode: Equatable {

    case custom, date, search, email, password

    func getTextFieldValidations(text: String, isFieldRequired: Bool = true) -> String {
        if text.isEmpty {
            if isFieldRequired {
                return Constants.GeneralConstants.thisFieldIsRequired
            } else {
                return ""
            }
        }
        switch self {
//        case .email:
//            return text.isValidEmail ? "" : Constants.SetupProfile.invalidEmail
        default:
            return ""
        }
    }

    func getTextFieldInputType() -> UIKeyboardType {
        switch self {
        default:
            return .default
        }
    }

    func getTextFieldTitle(text: String?) -> String {
        switch self {
        default:
            return ""
        }
    }

    func getTextFieldPlaceholder(text: String?) -> String {
        switch self {
        case .custom:
            return text ?? ""
        case .date:
            return Constants.GeneralConstants.selectDate
        case .search:
            return Constants.GeneralConstants.search
        case .email:
            return Constants.SignIn.enterEmailAddress
        case .password:
            return Constants.SignIn.enterPassword
        }
    }

    func getTextFieldTrailingIcon(placeHolderTrailingIcon: String?) -> String {
        switch self {
        case .custom:
            return  placeHolderTrailingIcon ?? ""
        case .date:
            return IconsConstants.TextFieldIcons.calendarIC
        default:
            return ""
        }
    }

    func getTextFieldLeadingIcon(placeHolderLeadingIcon: String?) -> String {
        switch self {
        case .search:
            return IconsConstants.TextFieldIcons.searchIC
        case .email:
            return IconsConstants.SignInConstantsIcons.emailIC
        case .password:
            return IconsConstants.SignInConstantsIcons.passwordIC
        case .custom:
            return placeHolderLeadingIcon ?? ""
        default:
            return ""
        }
    }
}
