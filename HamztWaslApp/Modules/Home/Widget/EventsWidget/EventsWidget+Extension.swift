//
//  EventsWidget+Extension.swift
//  HamztWaslApp
//
//  Created by Nour Gweda on 16/02/2025.
//

import Foundation
import SwiftUI

extension EventsWidget {

    func addLoadingEffect() {
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
            isLoading = false
        }
    }
}
