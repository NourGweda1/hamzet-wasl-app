//
//  LoadingHamztWaslView.swift
//  HamztWaslApp
//
//  Created by Nour Gweda on 26/02/2025.
//

import SwiftUI

struct LoadingHamztWaslView: View {
    @State private var isAnimating = false

    var body: some View {
        ZStack {
            Color.black.opacity(0.3)
                .edgesIgnoringSafeArea(.all)

            Image(IconsConstants.hamztWaslIcons.hamztWaslIcon)
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
                .foregroundColor(.white)
                .scaleEffect(isAnimating ? 1.2 : 1.0)
                .opacity(isAnimating ? 1.0 : 0.7)
                .animation(.easeInOut(duration: 1.0).repeatForever(autoreverses: true), value: isAnimating)
                .onAppear {
                    isAnimating = true
                }
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
