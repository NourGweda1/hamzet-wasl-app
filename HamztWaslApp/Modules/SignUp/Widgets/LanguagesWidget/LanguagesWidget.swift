//
//  LanguagesWidget.swift
//  HamztWaslApp
//
//  Created by Nour Gweda on 24/02/2025.
//

import SwiftUI

struct LanguagesWidget: View {

    @Binding var isPresented: Bool
    @Binding var languages: [String]
    @State var internalLanguages: [String] = []
    @State var internalSelectedLanguages: [String] = []
    @State var isLoading: Bool = true
    @State var keyword: String = ""
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
                TitleHeaderView(title: Constants.SignUp.selectLanguages,
                                buttonAction: {
                    isPresented = false
                })

                MainTextField(mode: .search,
                              placeHolderText: Constants.SignUp.searchForLanguage,
                              submitLabel: .return,
                              isTextFieldDisabled: .constant(false),
                              isValidData: .constant(false),
                              bindingText: $keyword)

                    ScrollView(showsIndicators: false) {
                        VStack(alignment: .leading, spacing: 16) {
                            ForEach(internalLanguages, id: \.self) { langaugeItem in
                                HStack(spacing: 12) {
                                    Image(internalSelectedLanguages.contains(where: { $0.localizedCaseInsensitiveContains(langaugeItem) }) ?
                                          IconsConstants.SignUpConstantsIcons.selectedMultipleIC :
                                            IconsConstants.SignUpConstantsIcons.unselectedMultipleIC)
                                    .resizable()
                                    .frame(width: 24, height: 24)

                                    Text(langaugeItem)
                                        .font(.system(size: 16, weight: .regular, design: .default))
                                        .foregroundColor(Color.themeColors.primary)
                                    Spacer()
                                }.padding(.leading, 4)
                                 .scaleEffect(internalSelectedLanguages.contains(where: { $0.localizedCaseInsensitiveContains(langaugeItem) }) ? 1.01 : 1.0)
                                 .animation(.spring(), value: internalSelectedLanguages.contains(where: { $0.localizedCaseInsensitiveContains(langaugeItem) }))
                                .onTapGesture {
                                    withAnimation {
                                        if internalSelectedLanguages.contains(where: { $0.localizedCaseInsensitiveContains(langaugeItem) }) {
                                            internalSelectedLanguages.removeAll(where: { $0 == langaugeItem })
                                        } else {
                                            internalSelectedLanguages.append(langaugeItem)
                                        }
                                    }
                                }
                            }
                        }.transition(.move(edge: .bottom).combined(with: .opacity))
                        .animation(.easeInOut(duration: 0.3), value: isLoading)
                    }.redacted(reason: isLoading ? .placeholder : [])

                    HamztWaslButton(title: Constants.AIEngineConstants.save,
                                    buttonAction: {
                        languages = internalSelectedLanguages
                        isPresented = false
                    }).buttonStyle(MainButtonStyle())
                    
                }.padding(.horizontal, 16)
                 .padding(.vertical, 24)
                 .background(Color.white)
                 .roundedCorner(20, corners: [.topLeft, .topRight])
                 .onChange(of: keyword) { newValue in
                     getLanguagesList(keyword: newValue)
                 }
        }.edgesIgnoringSafeArea(.bottom)
         .overlay(content: {
                LoadingHamztWaslView()
                 .isHidden(!isLoading, remove: true)
         })
         .onAppear {
             withAnimation(.easeInOut(duration: 0.7)) {
                 isLoading = true
                 opacity = 0.7
             }
             internalSelectedLanguages = languages
             getLanguagesList()
         }
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
    }
}

#Preview {
    LanguagesWidget(isPresented: .constant(true),
                    languages: .constant([]))
}
