//
//  HomeEventCardView+Extension.swift
//  HamztWaslApp
//
//  Created by Nour Gweda on 26/02/2025.
//

import SwiftUICore

extension HomeEventCardView {

    var similarityPercentage: String? {
        return String("\(String(format: "%.2f%%", (event.similarity ?? 0.0) * 100))")
    }
    var matchingPercentageColor: Color? {
        switch Int((event.similarity ?? 0.0) * 100) {
        case 0...40:
            return .matchingRed
        case 41...60:
            return .matchingOrange
        case 61...80:
            return .matchingLightGreen
        case 81...100:
            return .matchingGreen
        default:
            return .matchingGreen
        }
    }

    var name: String? {
        "\(event.eventCategory ?? "") \(event.eventType ?? "") in \(event.city ?? "") | \(event.location ?? "")"
    }

    func formatDate(_ dateString: String) -> String {
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "yyyy-MM-dd" // Input format

        let outputFormatter = DateFormatter()
        outputFormatter.dateFormat = "dd MMM \n yyyy" // Output format (07 Aug)

        if let date = inputFormatter.date(from: dateString) {
            return outputFormatter.string(from: date)
        }
        return dateString // Return original string if parsing fails
    }

    var aiImage: String {
        "https://pngtree.com/freebackground/artificial-intelligence-future-technology-background_980522.html"
    }
}
