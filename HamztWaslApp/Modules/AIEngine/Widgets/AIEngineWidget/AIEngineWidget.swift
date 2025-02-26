//
//  AIEngineWidget.swift
//  HamztWaslApp
//
//  Created by Nour Gweda on 17/02/2025.
//

import SwiftUI

struct AIEngineWidget: View {

    @Binding var isPresented: Bool
    @StateObject var handler = Handler()
    @State var shouldShowAnimation: Bool = false
    @State var isRecommendationPresented: Bool = false

    var body: some View {
        ZStack(alignment: .bottom) {
            Color.themeColors.primary

            VStack(alignment: .leading, spacing: 16) {
                AIEngineHeaderView()
                    .padding(.bottom, 8)

                ErrorView(errorText: Constants.AIEngineConstants.pleaseFillTheField)
                    .opacity(shouldShowAnimation ? 1 : 0)
                    .offset(y: shouldShowAnimation ? 0 : -20)
                    .animation(.easeInOut(duration: 0.5), value: shouldShowAnimation)
                    .isHidden(handler.isValidInputDate, remove: true)
                    .onAppear {
                        shouldShowAnimation = true
                    }
                    .onDisappear {
                        shouldShowAnimation = false
                    }

                SearchCriteriaView(selectedInterets: $handler.selectedInterets,
                                   selectedLocation: $handler.selectedLocation,
                                   selectedDate: $handler.selectedDate,
                                   isValidInterests: $handler.isValidInterests,
                                   isValidLocation: $handler.isValidLocation,
                                   isValidDate: $handler.isValidDate)

                SeperatorView()
                    .padding(.vertical, 8)

                SearchNoteView(note: $handler.note,
                               isNoteValid: $handler.isNoteValid)

                Spacer()

                HamztWaslButton(title: Constants.AIEngineConstants.submit,
                                buttonAction: {
                    handleSubmitAction()
                    isRecommendationPresented = true
                }).buttonStyle(MainButtonStyle())
                  .padding(.bottom, 50)
                  .opacity(handleSubmitValidation() ? 1 : 0.5)
                  .disabled(!handleSubmitValidation())

            }.padding(.vertical, 24)
             .padding(.horizontal, 16)
             .background(Color.white)
             .roundedCorner(20, corners: [.topLeft, .topRight])
             .padding(.top, 114)

            NavigationLink(isActive: $isRecommendationPresented) {
                RecommendationsWidget(isPresented: $isRecommendationPresented,
                                      recommendations: $handler.generalCriteria,
                                      events: $handler.recommendedEvents)
            } label: {
                EmptyView()
            }

        }.modifier(CustomToolbarModifier(isPresented: $isPresented, isNotificationVisible: true))
         .ignoresSafeArea()
         .onChange(of: handler.selectedInterets) { _ in
                setTextfieldsValidation()
         }.onChange(of: handler.selectedLocation) { _ in
                setTextfieldsValidation()
         }.onChange(of: handler.selectedDate) { _ in
                setTextfieldsValidation()
         }.onChange(of: handler.note) { _ in
                setTextfieldsValidation()
         }.onChange(of: handler.isValidInputDate) { newValue in
             shouldShowAnimation = !newValue
         }
    }


}

#Preview {
    AIEngineWidget(isPresented: .constant(true))
}
