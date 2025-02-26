//
//  MainTextField.swift
//  HamztWaslApp
//
//  Created by Nour Gweda on 14/02/2025.
//

import Foundation
import SwiftUI

struct MainTextField: View {
    var mode: TextFieldMode
    var title: String?
    var placeHolderText: String?
    var placeHolderLeadingIcon: String?
    var placeHolderTrailingIcon: String?
    var isRequired: Bool = true
    var maxLength: Int?
    var prefixString: String?

    @State var alertMessage = ""
    @State var isSecureField: Bool = false
    @State var isCountryViewVisible = false
    @State var submitLabel: SubmitLabel
    @FocusState var isFocused: Bool

    @Binding var isTextFieldDisabled: Bool
    @Binding var isValidData: Bool
    @Binding var bindingText: String

    var trailingView: AnyView?

    private var prefixColor: Color {
        if isTextFieldDisabled {
            return .themeColors.lightGrey
        } else {
            return .themeColors.primary
        }
    }

    private var textColor: Color {
        if isTextFieldDisabled {
            return .themeColors.primary
        } else {
            return .themeColors.primary
        }
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack {
                Text(mode.getTextFieldTitle(text: title))
                    .font(.system(size: 14, weight: .regular, design: .default))
                    .foregroundColor(Color.themeColors.lightGrey)
            }
            .padding(.bottom, 8)
            .frame(height: 28)
            .isHidden(title?.isEmpty ?? true, remove: true)

            HStack(spacing: 0) {
                Image(mode.getTextFieldLeadingIcon(placeHolderLeadingIcon: placeHolderLeadingIcon))
                    .padding(.leading, 16)
                    .isHidden(mode.getTextFieldLeadingIcon(placeHolderLeadingIcon: placeHolderLeadingIcon).isEmpty,
                              remove: true)

                if let prefix = prefixString, !prefix.isEmpty {
                    Text(prefix)
                        .foregroundColor(prefixColor)
                        .font(.system(size: 14, weight: .regular, design: .default))
                        .padding(.leading, 16)
                }

                SecureField(mode.getTextFieldPlaceholder(text: placeHolderText),
                            text: $bindingText)
                .isHidden(mode != .password, remove: true)
                .font(.system(size: 14, weight: .regular, design: .default))
                .foregroundColor(textColor)
                .submitLabel(submitLabel)
                .focused($isFocused)
                .padding(.horizontal, 16)
                .keyboardType(mode.getTextFieldInputType())
                .multilineTextAlignment(.leading)
                .autocorrectionDisabled(mode == .email)
                .autocapitalization((mode == .email) ? .none : .words)
                .onChange(of: bindingText) { newValue in
                    guard let maxLength else { return }
                    if newValue.count > maxLength {
                        bindingText = String(newValue.prefix(maxLength))
                    }
                }
                .disabled(isTextFieldDisabled || mode == .date)

                TextField("", text: $bindingText)
                    .placeholder(when: bindingText.isEmpty) {
                        Text(mode.getTextFieldPlaceholder(text: placeHolderText))
                            .font(.system(size: 14, weight: .regular, design: .default))
                            .foregroundColor(.themeColors.lightGrey)
                    }
                    .font(.system(size: 14, weight: .regular, design: .default))
                    .foregroundColor(textColor)
                    .submitLabel(submitLabel)
                    .focused($isFocused)
                    .padding(.horizontal, 16)
                    .keyboardType(mode.getTextFieldInputType())
                    .multilineTextAlignment(.leading)
                    .autocorrectionDisabled(mode == .email)
                    .autocapitalization((mode == .email) ? .none : .words)
                    .onChange(of: bindingText) { newValue in
                        guard let maxLength else { return }
                        if newValue.count > maxLength {
                            bindingText = String(newValue.prefix(maxLength))
                        }
                    }
                    .disabled(isTextFieldDisabled || mode == .date)
                    .isHidden(mode == .password, remove: true)
                Image(mode.getTextFieldTrailingIcon(placeHolderTrailingIcon: placeHolderTrailingIcon))
                    .padding(.horizontal, 16)
                if let trailingView {
                    trailingView
                        .padding(.horizontal, 16)
                }
            }
            .frame(height: 48)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(getBorderColor(), lineWidth: 1)
            )
            .background(Color.themeColors.background.cornerRadius(10))
//            .if(mode == .phoneNumber) { view in
//                view.environment(\.layoutDirection, .leftToRight)
//            }

            Text(alertMessage)
                .font(.system(size: 14, weight: .regular, design: .default))
                .foregroundColor(Color.themeColors.redColor)
                .multilineTextAlignment(.leading)
                .isHidden(alertMessage.isEmpty, remove: true)
                .padding(.top, 2)
                .isHidden(true, remove: true)
        }
        .onChange(of: bindingText) { _ in
            checkForValidations()
        }
    }
}

extension MainTextField {
    func getBorderColor() -> Color {
        if mode == .search {
            return Color.themeColors.lightGrey
        } else {
           return isValidData ? Color.themeColors.lightGrey : Color.themeColors.redColor
//            if isValidData {
//                if isFocused {
//                    return Color.themeColors.lightGrey
//                } else {
//                    return Color.themeColors.redColor
//                }
//            } else {
                // return (!alertMessage.isEmpty) ? Color.themeColors.redColor : Color.themeColors.lightGrey
//            }
        }
    }

    func checkForValidations() {
        alertMessage = mode.getTextFieldValidations(text: bindingText, isFieldRequired: isRequired)
        isValidData = alertMessage.isEmpty
    }
}
