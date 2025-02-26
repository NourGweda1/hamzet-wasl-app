//
//  HamztWaslButton.swift
//  HamztWaslApp
//
//  Created by Nour Gweda on 17/02/2025.
//

import SwiftUI

struct HamztWaslButton: View {

    let title: String
    var buttonAction: (() -> Void)
    @State private var isPressed = false

    var body: some View {
        Button {
            isPressed = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                isPressed = false
                buttonAction()
            }
        } label: {
            Text(title)
                .scaleEffect(isPressed ? 0.95 : 1.0)
                .opacity(isPressed ? 0.8 : 1.0)
                .animation(.easeInOut(duration: 0.1), value: isPressed)
        }
    }
}

#Preview {
    HamztWaslButton(title: "",
                    buttonAction: {})
}
