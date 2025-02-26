//
//  SeperatorView.swift
//  HamztWaslApp
//
//  Created by Nour Gweda on 17/02/2025.
//

import SwiftUI

struct SeperatorView: View {

    var title: String = Constants.AIEngineConstants.or

    var body: some View {
        HStack(spacing: 4) {
            Divider()
                .frame(maxWidth: .infinity, minHeight: 1, maxHeight: 1)
                .background(Color.themeColors.lightGrey)

            Text(title)
                .font(.system(size: 14, weight: .regular, design: .default))
                .foregroundColor(Color.themeColors.lightGrey)
            
            Divider()
                .frame(maxWidth: .infinity, minHeight: 1, maxHeight: 1)
                .background(Color.themeColors.lightGrey)
        }
    }
}

#Preview {
    SeperatorView()
}
