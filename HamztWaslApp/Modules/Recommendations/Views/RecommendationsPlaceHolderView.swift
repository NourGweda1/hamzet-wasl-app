//
//  RecommendationsPlaceHolderView.swift
//  HamztWaslApp
//
//  Created by Nour Gweda on 21/02/2025.
//

import SwiftUI

struct RecommendationsPlaceHolderView: View {
    var body: some View {
        VStack(spacing: 12) {
            Spacer()

            Image(IconsConstants.RecommendationsConstantsIcons.searchPlaceHolder)
                .resizable()
                .frame(width: 108, height: 108)
                .padding(.bottom, 4)

            Text(Constants.Recommendations.noResultFount)
                .font(.system(size: 20, weight: .bold, design: .default))
                .foregroundColor(.darkGrey)

            Text(Constants.Recommendations.editYourSearchCriteria)
                .font(.system(size: 15, weight: .regular, design: .default))
                .foregroundColor(.darkGrey)
                .multilineTextAlignment(.center)

            Spacer()
        }
    }
}

#Preview {
    RecommendationsPlaceHolderView()
}
