//
//  MainButtonStyle.swift
//  HamztWaslApp
//
//  Created by Nour Gweda on 17/02/2025.
//

import SwiftUI

struct MainButtonStyle: ButtonStyle {
    private let cornerRadius: CGFloat = 10
    private let height: CGFloat = 54
    @Environment(\.isEnabled) private var isEnabled: Bool
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 14, weight: .semibold, design: .default))
            .foregroundColor(.white)
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: height, maxHeight: height)
            .background((isEnabled) ? Color.themeColors.primary : Color.themeColors.primary.opacity(0.5))
            .cornerRadius(cornerRadius)
            .overlay {
                if configuration.isPressed && isEnabled {
                    Color.white.opacity(0.2)
                        .cornerRadius(cornerRadius)
                }
            }
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0) // Subtle scaling
            .animation(configuration.isPressed ? .easeOut(duration: 0.1) :
                    .spring(response: 0.4,  dampingFraction: 0.6),
                       value: configuration.isPressed)
    }
}
