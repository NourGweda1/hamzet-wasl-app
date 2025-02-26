//
//  HorizontalRTLModifier.swift
//  HamztWaslApp
//
//  Created by Nour Gweda on 16/02/2025.
//

import SwiftUI

struct HorizontalRTLModifier: ViewModifier {

    func body(content: Content) -> some View {
        content
            .environment(\.layoutDirection, getLayoutDirection())
            .scaleEffect(CGSize(width: 1, height: 1))
    }

    private func getLayoutDirection() -> LayoutDirection {
        return .leftToRight
    }
}

// MARK: - horizontalRTL Modifier
extension View {
    func horizontalRTL() -> some View {
        self.modifier(HorizontalRTLModifier())
    }
}
