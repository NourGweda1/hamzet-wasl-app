//
//  ProfessionWidget+Extension.swift
//  HamztWaslApp
//
//  Created by Nour Gweda on 24/02/2025.
//
import SwiftUI

extension ProfessionWidget {

    func getProfessionsList(keyword: String? = "") {
        Task {
            withAnimation {
                isLoading = true
            }
            do {
                if (keyword?.isEmpty ?? true) {
                    internalProfessions = try await handler.fetchOccupations()
                        .sorted { $0 < $1 }
                        .map({ $0 })
                } else {
                    internalProfessions = try await handler.fetchOccupations()
                        .sorted { $0 < $1 }
                        .map({ $0 })
                        .filter { profession in
                            profession.lowercased().contains(keyword?.lowercased() ?? "")
                        }
                }
                withAnimation {
                    isLoading = false
                }
                debugPrint(internalProfessions)
            } catch {
                isLoading = false
                debugPrint("Error fetching country names: \(error)")
            }
        }

    }

}
