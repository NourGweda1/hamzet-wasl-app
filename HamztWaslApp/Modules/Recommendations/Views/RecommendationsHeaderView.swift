//
//  RecommendationsHeaderView.swift
//  HamztWaslApp
//
//  Created by Nour Gweda on 21/02/2025.
//

import SwiftUI

struct RecommendationsHeaderView: View {

    let recommendations: String
    var editButtonAction: (() -> Void)

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 8) {
                Text(Constants.Recommendations.searchCriteria)
                    .font(.system(size: 12, weight: .regular, design: .default))
                    .foregroundColor(.themeColors.lightGrey)

                Text(recommendations)
                    .font(.system(size: 14, weight: .regular, design: .default))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
            }

            Spacer()

            Button {
                editButtonAction()
            } label: {
                Image(IconsConstants.RecommendationsConstantsIcons.editIC)
                    .resizable()
                    .frame(width: 20, height: 20)
                    .padding(10)
                    .background(Color.themeColors.lightGreen)
                    .cornerRadius(10)
            }

        }.padding(.vertical, 16)
         .padding(.horizontal, 20)
         .background {
             RoundedRectangle(cornerRadius: 20)
                 .fill(Color.themeColors.emralandGreen)
                 .overlay(
                     RoundedRectangle(cornerRadius: 20)
                         .stroke(Color.themeColors.lightEmralandGreen, lineWidth: 1))
         }
    }
}

#Preview {
    RecommendationsHeaderView(recommendations: "",
                              editButtonAction: {})
}
