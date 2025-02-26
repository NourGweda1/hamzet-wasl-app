//
//  HomeHeaderView.swift
//  HamztWaslApp
//
//  Created by Nour Gweda on 17/02/2025.
//

import SwiftUI

struct HomeHeaderView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Group {
                ProfileView()

                FeelingView()

            }.padding(.top,16)
             .padding(.horizontal,16)

            Spacer()

        }.frame(height: 200)
        .background(Color.themeColors.primary)
         
    }
}

#Preview {
    HomeHeaderView()
}
