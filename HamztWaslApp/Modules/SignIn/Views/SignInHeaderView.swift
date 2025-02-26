//
//  SignInHeaderView.swift
//  HamztWaslApp
//
//  Created by Nour Gweda on 22/02/2025.
//

import SwiftUI

struct SignInHeaderView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(Constants.SignIn.loginToYourAcc)
                .font(.system(size: 28, weight: .bold, design: .default))
                .foregroundColor(.themeColors.primary)

            Text(Constants.SignIn.continueEnjoyingBenefit)
                .font(.system(size: 15, weight: .regular, design: .default))
                .foregroundColor(.themeColors.darkGrey)
                .multilineTextAlignment(.leading)
        }
    }
}

#Preview {
    SignInHeaderView()
}
