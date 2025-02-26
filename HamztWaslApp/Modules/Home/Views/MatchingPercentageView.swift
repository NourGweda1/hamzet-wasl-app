//
//  MatchingPercentageView.swift
//  HamztWaslApp
//
//  Created by Nour Gweda on 21/02/2025.
//

import SwiftUI

struct MatchingPercentageView: View {

    let percentage: String
    let percentageColor: Color

    var body: some View {
        Group {
            Text(percentage)
                .font(.system(size: 13, weight: .bold, design: .default))
                .foregroundColor(.white)
        +
            Text(Constants.AIEngineConstants.match)
                .font(.system(size: 13, weight: .regular, design: .default))
                .foregroundColor(.white)
        }.padding(.vertical, 4)
         .padding(.horizontal, 16)
         .background(percentageColor)
         .cornerRadius(6)
    }
}

#Preview {
    MatchingPercentageView(percentage: "100%",
                           percentageColor: .green)
}
