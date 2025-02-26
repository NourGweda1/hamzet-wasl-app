//
//  String+Date.swift
//  HamztWaslApp
//
//  Created by Nour Gweda on 19/02/2025.
//
import Foundation

extension String {
    func toDate(format: String = "d MMMM, yyyy", locale: Locale = Locale(identifier: "en_US")) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.locale = locale
        return dateFormatter.date(from: self)
    }
}
