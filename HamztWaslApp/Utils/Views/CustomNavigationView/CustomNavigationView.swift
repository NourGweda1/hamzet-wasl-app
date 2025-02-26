//
//  CustomNavigationView.swift
//  HamztWaslApp
//
//  Created by Nour Gweda on 21/02/2025.
//

import Foundation
import SwiftUI


struct CustomNavigationView<Content: View>: View {
    var content: () -> Content

    init(@ViewBuilder _ content: @escaping () -> Content) {
        self.content = content
    }

    var body: some View {
        NavigationView {
            content()
                .navigationBarTitleDisplayMode(.inline)
        }
        // .accentColor(.customColors.charcoal)
    }
}
