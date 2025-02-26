//
//  SignInButtonView.swift
//  HamztWaslApp
//
//  Created by Nour Gweda on 22/02/2025.
//

import SwiftUI

struct SignInButtonView: View {

    let buttonTitle: String
    let buttonIcon: String

    var body: some View {
        HStack(spacing: 12) {
            Image(buttonIcon)
                .resizable()
                .frame(width: 24, height: 24)

            Text(buttonTitle)
                .font(.system(size: 14, weight: .regular, design: .default))
                .foregroundColor(.black)
        }.padding(.vertical, 20)
         .frame(maxWidth: .infinity, alignment: .center)
         .background(Color.themeColors.buttonBackground)
         .cornerRadius(10)
    }
}

#Preview {
    SignInButtonView(buttonTitle: "",
                     buttonIcon: "")
}
