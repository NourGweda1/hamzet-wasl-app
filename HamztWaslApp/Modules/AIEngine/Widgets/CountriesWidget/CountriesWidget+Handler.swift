//
//  CountriesWidget+Handler.swift
//  HamztWaslApp
//
//  Created by Nour Gweda on 18/02/2025.
//

import Foundation

extension CountriesWidget {

    @MainActor
    class Handler: ObservableObject {


        func fetchCountryNames() async throws -> [Country] {
            guard let url = URL(string: "https://country.io/names.json") else {
                throw URLError(.badURL)
            }

            let (data, _) = try await URLSession.shared.data(from: url)
            let countryDictionary = try JSONDecoder().decode([String: String].self, from: data)
            let countries = countryDictionary.map { Country(countryCode: $0.key, countryName: $0.value) }
            
            return countries
        }
    }
}
