//
//  HomeWidget.swift
//  HamztWaslApp
//
//  Created by Nour Gweda on 17/02/2025.
//

import SwiftUI

struct HomeWidget: View {

    @State var isAIEnginePresented: Bool = false

    var body: some View {
        ZStack(alignment: .top) {
            HomeHeaderView()
                .padding(.top, 24)
            
            EventsWidget()
                .padding(.top, 254)
            
            AIEngineView(aiEngineBtnClick: {
                isAIEnginePresented = true
            }).padding(.horizontal, 16)
              .offset(y: 210)

            NavigationLink(isActive: $isAIEnginePresented) {
                AIEngineWidget(isPresented: $isAIEnginePresented)
            } label: {
                EmptyView()
            }
        }.edgesIgnoringSafeArea(.bottom)
        .background(Color.themeColors.primary)
        
    }
}

#Preview {
    HomeWidget()
}
