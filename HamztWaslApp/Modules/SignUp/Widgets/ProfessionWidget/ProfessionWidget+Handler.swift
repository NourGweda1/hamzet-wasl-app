//
//  ProfessionWidget+Handler.swift
//  HamztWaslApp
//
//  Created by Nour Gweda on 24/02/2025.
//

import Foundation

extension ProfessionWidget {

    @MainActor
    class Handler: ObservableObject {

        func fetchOccupations() async throws -> [String] {
            guard let url = URL(string: "https://raw.githubusercontent.com/dariusk/corpora/master/data/humans/occupations.json") else {
                throw URLError(.badURL)
            }

            let (data, _) = try await URLSession.shared.data(from: url)
            let decodedResponse = try JSONDecoder().decode(Profession.self, from: data)
            
            return decodedResponse.occupations ?? []
        }
    }
}
