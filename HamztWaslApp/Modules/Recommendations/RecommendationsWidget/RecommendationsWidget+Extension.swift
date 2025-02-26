//
//  RecommendationsWidget+Extension.swift
//  HamztWaslApp
//
//  Created by Nour Gweda on 21/02/2025.
//

import SwiftUI

extension RecommendationsWidget {

    func addLoadingEffect() {
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
            isLoading = false
        }
    }
}
