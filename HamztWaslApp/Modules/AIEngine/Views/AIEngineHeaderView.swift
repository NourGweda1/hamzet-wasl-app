//
//  AIEngineHeaderView.swift
//  HamztWaslApp
//
//  Created by Nour Gweda on 17/02/2025.
//

import SwiftUI

struct AIEngineHeaderView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(Constants.AIEngineConstants.searchForEvents)
                .font(.system(size: 21, weight: .semibold, design: .default))
                .foregroundColor(.themeColors.primary)
                .padding(.bottom, -4)
            
            Text(Constants.AIEngineConstants.enterSearchCriteria)
                .font(.system(size: 15, weight: .regular, design: .default))
                .foregroundColor(.themeColors.darkGrey) +
            Text(Constants.AIEngineConstants.or)
                .bold()
                .font(.system(size: 15, weight: .regular, design: .default))
                .foregroundColor(.themeColors.darkGrey) +
            Text(Constants.AIEngineConstants.describeYourEventAndLetAI)
                .font(.system(size: 15, weight: .regular, design: .default))
                .foregroundColor(.themeColors.darkGrey)
                
        }
    }
}

#Preview {
    AIEngineHeaderView()
}
