//
//  TitleHeaderView.swift
//  HamztWaslApp
//
//  Created by Nour Gweda on 17/02/2025.
//

import SwiftUI

struct TitleHeaderView: View {

    let title: String
    var buttonAction: (() -> Void)

    var body: some View {
        HStack {
            Text(title)
                .font(.system(size: 21, weight: .semibold, design: .default))
                .foregroundColor(.themeColors.primary)

            Spacer()

            Button {
                buttonAction()
            } label: {
                Image(IconsConstants.AIEngineConstantsIcons.closeIC)
                    .resizable()
                    .frame(width: 30, height: 30)
            }
        }
    }
}

#Preview {
    TitleHeaderView(title: "",
                    buttonAction: {})
}
