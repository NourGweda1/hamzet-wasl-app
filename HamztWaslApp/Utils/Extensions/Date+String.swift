//
//  Date+String.swift
//  HamztWaslApp
//
//  Created by Nour Gweda on 19/02/2025.
//

import Foundation

extension Date {
    func toString(format: String = "d MMMM, yyyy", locale: Locale = Locale(identifier: "en_US")) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.locale = locale
        return dateFormatter.string(from: self)
    }

    func toBEString(format: String = "yyyy-MM-dd", locale: Locale = Locale(identifier: "en_US")) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.locale = locale
        return dateFormatter.string(from: self)
    }
}
