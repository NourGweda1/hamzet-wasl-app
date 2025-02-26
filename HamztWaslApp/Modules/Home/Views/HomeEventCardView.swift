//
//  HomeEventCardView.swift
//  HamztWaslApp
//
//  Created by Nour Gweda on 16/02/2025.
//

import SwiftUI
import Kingfisher

struct HomeEventCardView: View {

    let event: Event
    @State var eventDateText: String = ""
    @State var isHomeCell: Bool = true
    

    var body: some View {
        HStack(alignment: .bottom) {
            VStack(alignment: .leading, spacing: 12) {
                MatchingPercentageView(percentage: similarityPercentage ?? "",
                                       percentageColor: matchingPercentageColor ?? .themeColors.matchingGreen)
                .padding(.top, 20)
                .isHidden(isHomeCell, remove: true)

                Spacer()

                Text(isHomeCell ? (event.name ?? "") : (name ?? ""))
                    .font(.system(size: 18, weight: .semibold, design: .default))
                    .foregroundColor(.white)
                    .padding(.leading, isHomeCell ? 20 : 0)

                IconAndTextView(title: event.location ?? "", size: 16,
                                isSystemImage: false,
                                customImage: IconsConstants.HomeIconsConstants.locationIC,
                                fontColor: .lightGrey)
                .padding(.leading, isHomeCell ? 0 : -20)

                IconAndTextView(title: event.time ?? "Start at 8 PM", size: 16,
                                isSystemImage: false,
                                customImage: IconsConstants.HomeIconsConstants.clockIC,
                                fontColor: .lightGrey)
                .padding(.leading, isHomeCell ? 0 : -20)
            }

            Spacer()

            VStack {
                Spacer()

                Text(formatDate(eventDateText))
                    .font(.system(size: 16, weight: .bold, design: .default))
                    .foregroundColor(.lightGreen)
                    .multilineTextAlignment(.center)
                    .padding(16)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(.cultered)
                            .opacity(0.5)
                            .frame(width: 70, height: 70)
                    )
            }.padding(.trailing, isHomeCell ? 20 : 0)

        }.padding(.bottom, 20)
        .padding(.horizontal, isHomeCell ? 0 : 16)
        .frame(minWidth: 355,
               maxWidth: isHomeCell ? 355 : .infinity,
               minHeight: isHomeCell ? 420 : 380,
               maxHeight: isHomeCell ? 420 : 380)
         .background {
             Image(isHomeCell ? event.eventImage ?? "" : IconsConstants.EventsConstantsIcons.aiBackgroundIC)
                .resizable()
                .frame(minWidth: 355,
                       maxWidth: isHomeCell ? 355 : .infinity,
                       minHeight: isHomeCell ? 420 : 380,
                       maxHeight: isHomeCell ? 420 : 380)
        }
        .cornerRadius(20)
        .onAppear {
            eventDateText = event.date?.replacingOccurrences(of: " ", with: "\n") ?? ""
        }
        
    }
}

#Preview {
    HomeEventCardView(event: Event(id: "1",
                                   name: Constants.EventsConstants.firstEvent,
                                   location: Constants.EventsConstants.firstLocation,
                                   time: Constants.EventsConstants.firstTime,
                                   date: Constants.EventsConstants.firstDate,
                                   eventImage: IconsConstants.EventsConstantsIcons.firstEventIC))
}
