//
//  FeelingView.swift
//  HamztWaslApp
//
//  Created by Nour Gweda on 16/02/2025.
//

import SwiftUI

struct FeelingView: View {

    @State var displayedText: String = ""
    @State var charIndex = 0

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(alignment: .top, spacing: 8) {
                Text(Constants.HomeConstants.feeling)
                    .font(.system(size: 28, weight: .bold, design: .default))
                    .foregroundColor(.white)

                Text(displayedText)
                    .font(.system(size: 28, weight: .bold, design: .default))
                    .foregroundColor(.yellow)
                    .onAppear {
                        startTypingAnimation()
                    }
            }

            Text(Constants.HomeConstants.weGotThePerfectEventForYou)
                .font(.system(size: 20, weight: .semibold, design: .default))
                .foregroundColor(.white)
                .multilineTextAlignment(.leading)
        }
    }
}

#Preview {
    FeelingView()
}
