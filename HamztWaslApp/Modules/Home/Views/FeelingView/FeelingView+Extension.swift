//
//  FeelingView+Extension.swift
//  HamztWaslApp
//
//  Created by Nour Gweda on 21/02/2025.
//

import Foundation
import SwiftUI

extension FeelingView {

    func startTypingAnimation() {
        displayedText = ""
        charIndex = 0
        
        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { timer in
            if charIndex < Constants.HomeConstants.emotionHappy.count {
                let index = Constants.HomeConstants.emotionHappy.index(Constants.HomeConstants.emotionHappy.startIndex,
                                                                       offsetBy: charIndex)
                displayedText.append(Constants.HomeConstants.emotionHappy[index])
                charIndex += 1
            } else {
                timer.invalidate()
            }
        }
    }
}
