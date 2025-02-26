//
//  CalendarWidget.swift
//  HamztWaslApp
//
//  Created by Nour Gweda on 19/02/2025.
//

import SwiftUI

struct CalendarWidget: View {

    @Binding var isPresented: Bool
    @Binding var selectedDate: Date
    @State var internalDate: Date = Date()
    @State private var opacity = 0.0

    var body: some View {
        ZStack(alignment: .bottom) {
            
            Color.black.opacity(opacity)
                .ignoresSafeArea()
                .onTapGesture {
                    isPresented = false
                }

            VStack(alignment: .leading, spacing: 32) {
                TitleHeaderView(title: Constants.AIEngineConstants.selectLocation,
                                buttonAction: {
                    isPresented = false
                })

                CalendarView(selectedDate: $internalDate)

                
                Divider()
                    .foregroundColor(.themeColors.lightGrey)
                    .frame(height: 1)
                    .padding(.bottom, -26)

                HamztWaslButton(title: Constants.AIEngineConstants.save,
                                buttonAction: {
                    selectedDate = internalDate
                    isPresented = false
                }).buttonStyle(MainButtonStyle())
            }.padding(.vertical, 24)
             .padding(.horizontal, 16)
             .background(Color.white)
             .roundedCorner(20, corners: [.topLeft, .topRight])
             .onAppear {
                 internalDate = selectedDate
             }
        }.edgesIgnoringSafeArea(.bottom)
            .onChange(of: isPresented) { shouldDismiss in
                if !isPresented {
                    withAnimation {
                        opacity = 0.0
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                        isPresented = false
                    }
                }
            }
            .onAppear {
                withAnimation(.easeInOut(duration: 0.7)) {
                    opacity = 0.7
                }
            }
    }
}

#Preview {
    CalendarWidget(isPresented: .constant(true),
                   selectedDate: .constant(Date()))
}
