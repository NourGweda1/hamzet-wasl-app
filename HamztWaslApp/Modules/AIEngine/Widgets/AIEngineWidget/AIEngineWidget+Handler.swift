//
//  AIEngineWidget+Handler.swift
//  HamztWaslApp
//
//  Created by Nour Gweda on 17/02/2025.
//

import Foundation
import Combine

extension AIEngineWidget {
    @MainActor
    class Handler: ObservableObject {
        @Published var selectedInterets: String = ""
        @Published var selectedLocation: String = ""
        @Published var selectedDate: Date = Date()
        @Published var note: String = ""
        @Published var isValidInterests: Bool = true
        @Published var isValidLocation: Bool = true
        @Published var isValidDate: Bool = true
        @Published var isNoteValid: Bool = true
        @Published var futureDate = Calendar.current.date(byAdding: .year, value: 10, to: Date()) ?? Date()
        @Published var isValidInputDate: Bool = true
        @Published var generalCriteria: String = ""
        @Published var criteriaDictionary: [String: String] = ["": ""]
        @Published var recommendedEvents: [Event] = []

        private var cancellables = Set<AnyCancellable>()

        init() {
        }

        func fetchEvents(completion: @escaping (Result<[Event], Error>) -> Void) {
            guard let url = URL(string: "https://hamzet-wasl-engine.trianglz.info/api/v1/proxy/matches") else {
                completion(.failure(NSError(domain: "Invalid URL", code: 400)))
                return
            }

            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.addValue("application/json", forHTTPHeaderField: "accept")
            request.addValue("events", forHTTPHeaderField: "request-type")
            request.addValue("hwp_Mrq2w8UaQe00uzJcHZKw2_ERTi4lrq-LvsmuY5tEWJk", forHTTPHeaderField: "x-api-key")
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")

            let parameters: [String: Any] = [
                "query": generalCriteria,
                "num_matches": 10
            ]

            do {
                request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
            } catch {
                completion(.failure(error))
                return
            }

            URLSession.shared.dataTask(with: request) { data, response, error in
                if let error = error {
                    completion(.failure(error))
                    return
                }

                guard let data = data else {
                    completion(.failure(NSError(domain: "No data received", code: 500)))
                    return
                }

                do {
                    let decodedResponse = try JSONDecoder().decode([Event].self, from: data)
                    DispatchQueue.main.async {
                        completion(.success(decodedResponse))
                    }
                } catch {
                    completion(.failure(error))
                }
            }.resume()
        }

        func fetchData() {
            fetchEvents { result in
                switch result {
                case .success(let events):
                    self.recommendedEvents = events
                    debugPrint(events)
                case .failure(let error):
                    debugPrint(error.localizedDescription)
                }
            }
        }

    }
}
