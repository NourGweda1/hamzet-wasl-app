//
//  Double+Percentage.swift
//  HamztWaslApp
//
//  Created by Nour Gweda on 26/02/2025.
//
import Foundation

extension Double {
    func rounded(toPlaces places: Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
