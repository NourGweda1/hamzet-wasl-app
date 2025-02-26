//
//  ProfessionWidget.swift
//  HamztWaslApp
//
//  Created by Nour Gweda on 24/02/2025.
//

import SwiftUI

struct ProfessionWidget: View {

    @Binding var isPresented: Bool
    @Binding var profession: String
    @State var internalProfessions: [String] = []
    @State var internalProfession: String = ""
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
                TitleHeaderView(title: Constants.SignUp.selectIndustry,
                                buttonAction: {
                    isPresented = false
                })

                MainTextField(mode: .search,
                              placeHolderText: Constants.SignUp.searchForWork,
                              submitLabel: .return,
                              isTextFieldDisabled: .constant(false),
                              isValidData: .constant(false),
                              bindingText: $keyword)

                    ScrollView(showsIndicators: false) {
                        VStack(alignment: .leading, spacing: 16) {
                            ForEach(internalProfessions, id: \.self) { professionItem in
                                HStack(spacing: 12) {
                                    Image(internalProfession == professionItem ?
                                          IconsConstants.AIEngineConstantsIcons.selectedItemIC :
                                            IconsConstants.AIEngineConstantsIcons.unselectedItemIC)
                                    .resizable()
                                    .frame(width: 24, height: 24)

                                    Text(professionItem)
                                        .font(.system(size: 16, weight: .regular, design: .default))
                                        .foregroundColor(Color.themeColors.primary)
                                    Spacer()
                                }.padding(.leading, 4)
                                .scaleEffect(internalProfession == professionItem ? 1.01 : 1.0)
                                 .animation(.spring(), value: internalProfession == professionItem)
                                 .onTapGesture {
                                    withAnimation {
                                        internalProfession = professionItem
                                    }
                                }
                            }
                        }.transition(.move(edge: .bottom).combined(with: .opacity))
                        .animation(.easeInOut(duration: 0.3), value: isLoading)
                    }.redacted(reason: isLoading ? .placeholder : [])

                    HamztWaslButton(title: Constants.AIEngineConstants.save,
                                    buttonAction: {
                        profession = internalProfession
                        isPresented = false
                    }).buttonStyle(MainButtonStyle())
                    
                }.padding(.horizontal, 16)
                 .padding(.vertical, 24)
                 .background(Color.white)
                 .roundedCorner(20, corners: [.topLeft, .topRight])
                 .onAppear {
                     internalProfession = profession
                     getProfessionsList()
                 }.onChange(of: keyword) { newValue in
                     getProfessionsList(keyword: newValue)
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
                isLoading = true
                opacity = 0.7
            }
        }
    }
}

#Preview {
    ProfessionWidget(isPresented: .constant(true),
                     profession: .constant(""))
}
