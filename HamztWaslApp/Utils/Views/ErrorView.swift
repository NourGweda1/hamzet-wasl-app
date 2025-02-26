//
//  ErrorView.swift
//  HamztWaslApp
//
//  Created by Nour Gweda on 19/02/2025.
//

import SwiftUI

struct ErrorView: View {

    let errorText: String

    var body: some View {

        HStack(spacing: 16) {
            Image(systemName: "exclamationmark.circle.fill")
                .resizable()
                .frame(width: 20, height: 20)
                .foregroundColor(.themeColors.redColor)

            Text(errorText)
                .font(.system(size: 14, weight: .regular, design: .default))
                .foregroundColor(Color.themeColors.redColor)
                .multilineTextAlignment(.leading)
        }.padding(.horizontal, 20)
         .frame(maxWidth: .infinity, alignment: .leading)
         .padding(.vertical, 16)
         .background(Color.themeColors.lightRed)
         .cornerRadius(8)
    }
}

#Preview {
    ErrorView(errorText: "")
}
