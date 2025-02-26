//
//  CountriesWidget.swift
//  HamztWaslApp
//
//  Created by Nour Gweda on 18/02/2025.
//

import SwiftUI

struct CountriesWidget: View {

    @Binding var isPresented: Bool
    @Binding var country: String
    @State var internalCountries: [String] = []
    @State var internalCountry: String = ""
    @State var isLoading: Bool = true
    @State var keyword: String = ""
    @State var isNavigatedFromSignUp: Bool = false
    @StateObject var handler = Handler()
    @State private var opacity = 0.0

    var body: some View {
        ZStack(alignment: .bottom) {
            
            Color.black.opacity(opacity)
                .ignoresSafeArea()
                .onTapGesture {
                    isPresented = false
                }

            VStack(alignment: .leading, spacing: 16) {
                TitleHeaderView(title: isNavigatedFromSignUp ?
                                Constants.SignUp.selectCountry :
                                    Constants.AIEngineConstants.selectLocation,
                                buttonAction: {
                    isPresented = false
                })

                MainTextField(mode: .search,
                              placeHolderText: Constants.AIEngineConstants.searchForCountries,
                              submitLabel: .return,
                              isTextFieldDisabled: .constant(false),
                              isValidData: .constant(false),
                              bindingText: $keyword)

                    ScrollView(showsIndicators: false) {
                        VStack(alignment: .leading, spacing: 16) {
                            ForEach(internalCountries, id: \.self) { countryItem in
                                HStack(spacing: 12) {
                                    Image(internalCountry == countryItem ?
                                          IconsConstants.AIEngineConstantsIcons.selectedItemIC :
                                            IconsConstants.AIEngineConstantsIcons.unselectedItemIC)
                                    .resizable()
                                    .frame(width: 24, height: 24)

                                    Text(countryItem)
                                        .font(.system(size: 16, weight: .regular, design: .default))
                                        .foregroundColor(Color.themeColors.primary)
                                    Spacer()
                                }.padding(.leading, 4)
                                 .scaleEffect(internalCountry == countryItem ? 1.01 : 1.0)
                                 .animation(.spring(), value: internalCountry == countryItem)
                                 .onTapGesture {
                                    withAnimation {
                                        internalCountry = countryItem
                                    }
                                }
                            }
                        }.transition(.move(edge: .bottom).combined(with: .opacity))
                        .animation(.easeInOut(duration: 0.3), value: isLoading)
                    }.redacted(reason: isLoading ? .placeholder : [])

                    HamztWaslButton(title: Constants.AIEngineConstants.save,
                                    buttonAction: {
                        country = internalCountry
                        isPresented = false
                    }).buttonStyle(MainButtonStyle())
                    
                }.padding(.horizontal, 16)
                 .padding(.vertical, 24)
                 .background(Color.white)
                 .roundedCorner(20, corners: [.topLeft, .topRight])
                 .onAppear {
                     internalCountry = country
                     getCountriesList()
                 }.onChange(of: keyword) { newValue in
                     getCountriesList(keyword: newValue)
                 }
        }.edgesIgnoringSafeArea(.bottom)
        .overlay(content: {
            LoadingHamztWaslView()
                .isHidden(!isLoading, remove: true)
        })
        .onChange(of: isPresented) { shouldDismiss in
            if !isPresented {
                withAnimation {
                    opacity = 0.0
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                    isPresented = false
                }
            }
        }.onAppear {
            withAnimation(.easeInOut(duration: 0.7)) {
                opacity = 0.7
                isLoading = true
            }
        }
    }
}

#Preview {
    CountriesWidget(isPresented: .constant(true),
                    country: .constant(""))
}
