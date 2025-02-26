//
//  ProfileView.swift
//  HamztWaslApp
//
//  Created by Nour Gweda on 12/02/2025.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        HStack(spacing: 8) {
            Image(UserSession.shared.currentUser?.image ?? IconsConstants.HomeIconsConstants.profileIC)
                .resizable()
                .frame(width: 40, height: 40)
                .cornerRadius(10)

            VStack(alignment: .leading, spacing: 4) {
                Text(Constants.HomeConstants.goodMorning)
                    .font(.system(size: 12, weight: .regular, design: .default))
                    .foregroundColor(.white)

                Text(UserSession.shared.currentUser?.name ?? Constants.HomeConstants.name)
                    .font(.system(size: 14, weight: .bold, design: .default))
                    .foregroundColor(.white)
            }

            Spacer()

            Image(systemName: "bell")
                .resizable()
                .frame(width: 24, height: 24)
                .foregroundColor(.white)
        }
    }
}

#Preview {
    ProfileView()
}
