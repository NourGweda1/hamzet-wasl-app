//
//  AIEngineView.swift
//  HamztWaslApp
//
//  Created by Nour Gweda on 16/02/2025.
//

import SwiftUI

struct AIEngineView: View {

    var aiEngineBtnClick: (() -> Void)

    var body: some View {
        HStack(spacing: 8) {
            VStack(alignment: .leading, spacing: 4) {
                Text(Constants.HomeConstants.hurryUp)
                    .font(.system(size: 18, weight: .semibold, design: .default))
                    .foregroundColor(.themeColors.primary)

                Text(Constants.HomeConstants.useTheIntellegentMatchMaking)
                    .font(.system(size: 13, weight: .bold, design: .default))
                    .foregroundColor(.lightGrey)
                    .multilineTextAlignment(.leading)
            }

            Spacer()

            Button {
                aiEngineBtnClick()
            } label: {
                Image(systemName: "arrow.right")
                    .resizable()
                    .frame(width: 24, height: 24)
                    .foregroundColor(.white)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.themeColors.lightGreen)
                            .frame(width: 50, height: 50)
                    )
            }.padding(.trailing, 8)
        }.padding(24)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(.white)
                .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 5)
        )
    }
}

#Preview {
    AIEngineView(aiEngineBtnClick: {})
}
