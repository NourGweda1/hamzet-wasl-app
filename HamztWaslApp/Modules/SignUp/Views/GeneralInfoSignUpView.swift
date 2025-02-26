//
//  GeneralInfoSignUpView.swift
//  HamztWaslApp
//
//  Created by Nour Gweda on 26/02/2025.
//

import SwiftUI

struct GeneralInfoSignUpView: View {

    @Binding var country: String
    @Binding var languages: [String]
    @Binding var profession: String
    @Binding var languagesString: String
    @Binding var isValidcountry: Bool
    @Binding var isValidlanguages: Bool
    @Binding var isValidProfession: Bool

    @State var isCountriesPresented: Bool = false
    @State var isLanguagesPresented: Bool = false
    @State var isProfessionPresented: Bool = false

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {

            // MARK: - country textfield
            MainTextField(mode: .custom,
                          placeHolderText: Constants.SignUp.selectCountry,
                          placeHolderLeadingIcon: IconsConstants.SignUpConstantsIcons.mapIC,
                          placeHolderTrailingIcon: IconsConstants.TextFieldIcons.arrowIC,
                          submitLabel: .return,
                          isTextFieldDisabled: .constant(true),
                          isValidData: $isValidcountry,
                          bindingText: $country)
            .onTapGesture {
                isCountriesPresented = true
            }

            // MARK: - languages textfield
            MainTextField(mode: .custom,
                          placeHolderText: Constants.SignUp.selectLanguages,
                          placeHolderLeadingIcon: IconsConstants.SignUpConstantsIcons.globeIC,
                          placeHolderTrailingIcon: IconsConstants.TextFieldIcons.arrowIC,
                          submitLabel: .return,
                          isTextFieldDisabled: .constant(true),
                          isValidData: $isValidlanguages,
                          bindingText: $languagesString)
            .onTapGesture {
                isLanguagesPresented = true
            }

            // MARK: - profession textfield
            MainTextField(mode: .custom,
                          placeHolderText: Constants.SignUp.selectIndustry,
                          placeHolderLeadingIcon: IconsConstants.SignUpConstantsIcons.professionIC,
                          placeHolderTrailingIcon: IconsConstants.TextFieldIcons.arrowIC,
                          submitLabel: .return,
                          isTextFieldDisabled: .constant(true),
                          isValidData: $isValidProfession,
                          bindingText: $profession)
            .onTapGesture {
                isProfessionPresented = true
            }
        }.fullScreenCover(isPresented: $isCountriesPresented) {
            CountriesWidget(isPresented: $isCountriesPresented,
                            country: $country,
                            isNavigatedFromSignUp: true)
            .clearModalBackground()
        }.fullScreenCover(isPresented: $isLanguagesPresented) {
            LanguagesWidget(isPresented: $isLanguagesPresented,
                            languages: $languages)
            .clearModalBackground()
        }.fullScreenCover(isPresented: $isProfessionPresented) {
            ProfessionWidget(isPresented: $isProfessionPresented,
                             profession: $profession)
            .clearModalBackground()
        }.onChange(of: languages) { newValue in
            languagesString = newValue.joined(separator: ", ")
        }
    }
}

#Preview {
    GeneralInfoSignUpView(country: .constant(""),
                          languages: .constant([]),
                          profession: .constant(""),
                          languagesString: .constant(""),
                          isValidcountry: .constant(true),
                          isValidlanguages: .constant(true),
                          isValidProfession: .constant(true))
}
