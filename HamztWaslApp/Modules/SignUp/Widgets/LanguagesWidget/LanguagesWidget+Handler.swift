//
//  LanguagesWidget+Handler.swift
//  HamztWaslApp
//
//  Created by Nour Gweda on 24/02/2025.
//

import Foundation

extension LanguagesWidget {

    @MainActor
    class Handler: ObservableObject {

        func fetchLanguageNames() async throws -> [String] {
            guard let url = URL(string: "https://gist.githubusercontent.com/Josantonius/b455e315bc7f790d14b136d61d9ae469/raw/language-codes.json") else {
                throw URLError(.badURL)
            }
            
            let (data, _) = try await URLSession.shared.data(from: url)
            let languageDictionary = try JSONDecoder().decode([String: String].self, from: data)
            
            return Array(languageDictionary.values)
        }
    }
}
