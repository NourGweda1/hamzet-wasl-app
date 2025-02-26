//
//  CustomToolBarModifier.swift
//  HamztWaslApp
//
//  Created by Nour Gweda on 21/02/2025.
//

import Foundation
import SwiftUI

struct CustomToolbarModifier: ViewModifier {
    @Binding var isPresented: Bool
    let isNotificationVisible: Bool

    func body(content: Content) -> some View {
        content
            .toolbar {
                // Custom Back Button (Leading)
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        isPresented = false
                    }) {
                        Image(systemName: "arrow.backward")
                            .resizable()
                            .frame(width: 24, height: 24)
                            .foregroundColor(isNotificationVisible ? .white : .themeColors.primary)
                    }
                }

                // Notification Icon (Trailing)
                ToolbarItem(placement: .navigationBarTrailing) {
                    if isNotificationVisible {
                        Image(systemName: "bell")
                            .resizable()
                            .frame(width: 24, height: 24)
                            .foregroundColor(.white)
                    }
                }
            }
            .navigationBarBackButtonHidden(true) // Hide Native Back Button
    }
}
