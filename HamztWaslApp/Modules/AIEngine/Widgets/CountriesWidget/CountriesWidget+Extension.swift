//
//  CountriesWidget+Extension.swift
//  HamztWaslApp
//
//  Created by Nour Gweda on 18/02/2025.
//

import Foundation
import SwiftUI

extension CountriesWidget {

    func getCountriesList(keyword: String? = "") {
        Task {
            withAnimation {
                isLoading = true
            }
            do {
                if (keyword?.isEmpty ?? true) {
                    internalCountries = try await handler.fetchCountryNames()
                        .sorted { $0.countryName ?? "" < $1.countryName ?? ""}
                        .map({ $0.countryName ?? "" })
                } else {
                    internalCountries = try await handler.fetchCountryNames()
                        .sorted { $0.countryName ?? "" < $1.countryName ?? ""}
                        .map({ $0.countryName ?? "" })
                        .filter { country in
                            country.lowercased().contains(keyword?.lowercased() ?? "")
                        }
                }
                withAnimation {
                    isLoading = false
                }
                debugPrint(internalCountries)
            } catch {
                isLoading = false
                debugPrint("Error fetching country names: \(error)")
            }
        }

    }
}
