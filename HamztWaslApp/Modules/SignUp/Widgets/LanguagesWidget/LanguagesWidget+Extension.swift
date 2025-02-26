//
//  LanguagesWidget+Extension.swift
//  HamztWaslApp
//
//  Created by Nour Gweda on 24/02/2025.
//
import SwiftUI

extension LanguagesWidget {

    func getLanguagesList(keyword: String? = "") {
        Task {
            withAnimation {
                isLoading = true
            }
            do {
                if (keyword?.isEmpty ?? true) {
                    internalLanguages = try await handler.fetchLanguageNames()
                        .sorted { $0 < $1 }
                        .map({ $0 })
                } else {
                    internalLanguages = try await handler.fetchLanguageNames()
                        .sorted { $0 < $1 }
                        .map({ $0  })
                        .filter { language in
                            language.lowercased().contains(keyword?.lowercased() ?? "")
                        }
                }
                withAnimation {
                    isLoading = false
                }
                debugPrint(internalLanguages)
            } catch {
                withAnimation {
                    isLoading = false
                }
                debugPrint("Error fetching country names: \(error)")
            }
        }

    }
}
