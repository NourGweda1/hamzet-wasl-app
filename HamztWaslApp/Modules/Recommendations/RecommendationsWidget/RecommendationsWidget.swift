//
//  RecommendationsWidget.swift
//  HamztWaslApp
//
//  Created by Nour Gweda on 21/02/2025.
//

import SwiftUI

struct RecommendationsWidget: View {

    @Binding var isPresented: Bool
    @Binding var recommendations: String
    @Binding var events: [Event]
    @State var isLoading: Bool = true

    var body: some View {

        VStack {
            // MARK: - Header
            VStack {
                RecommendationsHeaderView(recommendations: recommendations,
                                          editButtonAction: {
                    isPresented = false
                })
                    .padding(.vertical, 20)
                    .padding(.horizontal, 16)
            }.frame(height: 168)
             .background(Color.themeColors.primary)

            // MARK: - Scroll view
            VStack(alignment: .leading, spacing: 16) {
                Group {
                    Text(Constants.Recommendations.recommendedForYou)
                        .font(.system(size: 21, weight: .bold, design: .default))
                        .foregroundColor(Color.themeColors.primary)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, 28)

                    ScrollView(showsIndicators: false) {
                        VStack(alignment: .leading, spacing: 16) {
                            ForEach(events, id: \.id) { event in
                                HomeEventCardView(event: event, isHomeCell: false)
                            }
                        }
                    }.redacted(reason: isLoading ? .placeholder : [])
                     .frame(maxWidth: .infinity, alignment: .center)

                    Spacer()
                }.isHidden(events.isEmpty, remove: true)

                RecommendationsPlaceHolderView()
                    .frame(maxWidth: .infinity, alignment: .center)
                    .isHidden(!events.isEmpty, remove: true)

            }.padding(.horizontal, 16)
             .background(Color.white)
             .roundedCorner(20, corners: [.topLeft, .topRight])
             .edgesIgnoringSafeArea(.bottom)
             .modifier(CustomToolbarModifier(isPresented: $isPresented, isNotificationVisible: true))
        }.background(Color.themeColors.primary)
         .overlay(content: {
             LoadingHamztWaslView()
                 .isHidden(!isLoading, remove: true)
        })
         .onAppear {
             addLoadingEffect()
        }
    }
}

#Preview {
    RecommendationsWidget(isPresented: .constant(true),
                          recommendations: .constant(""),
                          events: .constant([]))
}
