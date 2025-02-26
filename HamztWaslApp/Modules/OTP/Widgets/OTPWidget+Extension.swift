//
//  OTPWidget+Extension.swift
//  HamztWaslApp
//
//  Created by Nour Gweda on 22/02/2025.
//

import Foundation

extension OTPWidget {

    func startTimer() {
        timer = Timer.publish(every: 1, on: .main, in: .common)
            .autoconnect()
            .sink { _ in
                if timeRemaining > 0 {
                    timeRemaining -= 1
                } else {
                    timer?.cancel() // Stop the timer at 0
                }
            }
    }

    func timeFormatted(_ totalSeconds: Int) -> String {
        let minutes = totalSeconds / 60
        let seconds = totalSeconds % 60
        return String(format: "%d:%02d", minutes, seconds)
    }

    func handleOTPValidation() {
        if UserSession.shared.currentUser?.otp == verificationCode && verificationCode.isSixDigitNumber {
            isConfirmationPresented = true 
        }
    }
}
