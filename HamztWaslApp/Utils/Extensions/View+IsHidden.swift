//
//  View+IsHidden.swift
//  HamztWaslApp
//
//  Created by Nour Gweda on 16/02/2025.
//

import SwiftUI

extension View {
    @ViewBuilder func isHidden(_ hidden: Bool, remove: Bool = false) -> some View {
        if hidden {
            if !remove {
                self.hidden()
            }
        } else {
            self
        }
    }
}
