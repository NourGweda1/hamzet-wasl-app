//
//  SearchCriteriaView.swift
//  HamztWaslApp
//
//  Created by Nour Gweda on 17/02/2025.
//

import SwiftUI

struct SearchCriteriaView: View {

    @Binding var selectedInterets: String
    @Binding var selectedLocation: String
    @Binding var selectedDate: Date
    @Binding var isValidInterests: Bool
    @Binding var isValidLocation: Bool
    @Binding var isValidDate: Bool

    @State var isInterestsPresented: Bool = false
    @State var isLocationPresented: Bool = false
    @State var isDatePresented: Bool = false
    @State var internalSelectedDate: String = ""

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            MainTextField(mode: .custom,
                          placeHolderText: Constants.AIEngineConstants.selectInterests,
                          placeHolderTrailingIcon: IconsConstants.TextFieldIcons.arrowIC,
                          submitLabel: .return,
                          isTextFieldDisabled: .constant(true),
                          isValidData: $isValidInterests,
                          bindingText: $selectedInterets)
            .onTapGesture {
                isInterestsPresented = true
            }

            MainTextField(mode: .custom,
                          placeHolderText: Constants.AIEngineConstants.selectLocation,
                          placeHolderTrailingIcon: IconsConstants.TextFieldIcons.arrowIC,
                          submitLabel: .return,
                          isTextFieldDisabled: .constant(true),
                          isValidData: $isValidLocation,
                          bindingText: $selectedLocation)
            .onTapGesture {
                isLocationPresented = true
            }

            MainTextField(mode: .date,
                          placeHolderText: Constants.AIEngineConstants.selectDate,
                          submitLabel: .return,
                          isTextFieldDisabled: .constant(false),
                          isValidData: $isValidDate,
                          bindingText: $internalSelectedDate)
            .onTapGesture {
                isDatePresented = true
            }
        }.fullScreenCover(isPresented: $isInterestsPresented) {
            InterestsSelectionView(isPresented: $isInterestsPresented,
                                   interestes: $selectedInterets)
            .clearModalBackground()
        }.fullScreenCover(isPresented: $isLocationPresented) {
            CountriesWidget(isPresented: $isLocationPresented,
                            country: $selectedLocation)
            .clearModalBackground()
        }.fullScreenCover(isPresented: $isDatePresented) {
            CalendarWidget(isPresented: $isDatePresented,
                           selectedDate: $selectedDate)
            .clearModalBackground()
        }.onChange(of: selectedDate) { newValue in
            if compareDates(selectedDate: selectedDate.toString()) {
                internalSelectedDate = ""
            } else {
                internalSelectedDate = newValue.toString()
            }
        }
    }

    func compareDates(selectedDate: String) -> Bool {
        let calendar = Calendar.current

        let components1 = calendar.dateComponents([.year, .month, .day], from: selectedDate.toDate() ?? Date())
        let components2 = calendar.dateComponents([.year, .month, .day], from: Date())

        return components1 == components2
    }
}

#Preview {
    SearchCriteriaView(selectedInterets: .constant(""),
                       selectedLocation: .constant(""),
                       selectedDate: .constant(Date()),
                       isValidInterests: .constant(true),
                       isValidLocation: .constant(true),
                       isValidDate: .constant(true))
}
