//
//  AIEngineWidget+Extension.swift
//  HamztWaslApp
//
//  Created by Nour Gweda on 21/02/2025.
//

import Foundation

extension AIEngineWidget {

    func handleSubmitValidation() -> Bool {
        (!handler.selectedInterets.isEmpty &&
         !handler.selectedLocation.isEmpty &&
         (handler.selectedDate >= Date() && handler.selectedDate <= handler.futureDate)) || !handler.note.isEmpty
    }

    func setTextfieldsValidation() {
        handleCriteriaValidations()
        handleNoteValidation()
        handleErrorValidation()
        handleCrossCriteriaValidations()
    }

    func handleCriteriaValidations() {
        handler.isValidInterests = !handler.selectedInterets.isEmpty
        handler.isValidLocation = !handler.selectedLocation.isEmpty
        handler.isValidDate = (handler.selectedDate >= Date() && handler.selectedDate <= handler.futureDate)
    }

    func handleNoteValidation() {
        handler.isNoteValid = !handler.note.isEmpty
    }

    func handleErrorValidation() {
        handler.isValidInputDate = (handler.isValidInterests && handler.isValidLocation && handler.isValidDate) || handler.isNoteValid
    }

    func handleCrossCriteriaValidations() {
        if handler.isValidInterests && handler.isValidLocation && handler.isValidDate {
            handler.isNoteValid = true
        } else if handler.isNoteValid {
            handler.isValidInterests = true
            handler.isValidLocation = true
            handler.isValidDate = true
        }
    }

    func handleSubmitAction() {
        if !handler.selectedInterets.isEmpty &&
            !handler.selectedLocation.isEmpty &&
            (handler.selectedDate >= Date() && handler.selectedDate <= handler.futureDate) {
            handler.fetchData()
            handler.criteriaDictionary[Constants.AIEngineConstants.interestsKeyword] = handler.selectedInterets
            handler.criteriaDictionary[Constants.AIEngineConstants.locationKeyword] = handler.selectedLocation
            handler.criteriaDictionary[Constants.AIEngineConstants.dateKeyword] = handler.selectedDate.toString()
            debugPrint(handler.criteriaDictionary, "📖")
            handler.generalCriteria =
            "\(Constants.AIEngineConstants.interestsKeyword) \(String(handler.selectedInterets.filter { !isEmoji($0) })) | \(Constants.AIEngineConstants.locationKeyword) \(handler.selectedLocation) | \(Constants.AIEngineConstants.dateKeyword)  \(handler.selectedDate.toBEString())"
            debugPrint(handler.generalCriteria, "📝")
        } else if !handler.note.isEmpty {
            handler.generalCriteria = handler.note
            handler.fetchData()
            debugPrint(handler.generalCriteria, "📝")
        }
    }

    func isEmoji(_ character: Character) -> Bool {
        return character.unicodeScalars.contains { scalar in
            scalar.properties.isEmoji
        }
    }
}
