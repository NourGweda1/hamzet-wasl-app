//
//  EventsWidget.swift
//  HamztWaslApp
//
//  Created by Nour Gweda on 16/02/2025.
//

import SwiftUI

struct EventsWidget: View {

    @State var isLoading: Bool = false

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {

            Text(Constants.HomeConstants.trendEvent)
                .font(.system(size: 21, weight: .bold, design: .default))
                .foregroundColor(Color.themeColors.primary)
                .padding(.top, 84)
                .padding(.leading, 16)

            HorizontalScrollView(horizontalSpacing: 12, horizontalPadding: 12) {
                ForEach(fetchEventsList(), id: \.id) { event in
                    HomeEventCardView(event: event)
                }
            }.redacted(reason: isLoading ? .placeholder : [])

            Spacer()

        }.padding(.bottom, 50)
        .background(Color.white)
        .roundedCorner(20, corners: [.topLeft, .topRight])
        .onAppear {
            addLoadingEffect()
        }
    }
}

#Preview {
    EventsWidget()
}
