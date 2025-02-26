//
//  InterestsSelectionView.swift
//  HamztWaslApp
//
//  Created by Nour Gweda on 17/02/2025.
//

import SwiftUI

struct InterestsSelectionView: View {

    @Binding var isPresented: Bool
    @Binding var interestes: String
    @State var internalInterests: [String] = []
    @State var isLoading: Bool = true
    @State private var opacity = 0.0

    var columns: [GridItem] {
        let hasSpace = internalInterests.contains { $0.contains(" ") }
            return Array(
                repeating: GridItem(.flexible(), spacing: 0),
                count: hasSpace ? 3 : 2
            )
        }

    let spacing: CGFloat = 12
    let horizontalPadding: CGFloat = 16

    var body: some View {
        ZStack(alignment: .bottom) {
            
            Color.black.opacity(opacity)
                .ignoresSafeArea()
                .onTapGesture {
                    isPresented = false
                }

            VStack(alignment: .leading, spacing: 16) {
                TitleHeaderView(title: Constants.AIEngineConstants.selectInterests,
                                buttonAction: {
                    isPresented = false
                })
                .padding(.horizontal, 16)
                
                GeometryReader { geometry in
                    let availableWidth = geometry.size.width - (horizontalPadding * 2) - 16
                    let rows = arrangeItemsIntoRows(items: fetchAllInterets(), containerWidth: availableWidth)

                    ScrollView(showsIndicators: false) {
                        VStack(alignment: .leading, spacing: spacing) {
                            ForEach(rows.indices, id: \.self) { rowIndex in
                                HStack(spacing: spacing) {
                                    ForEach(rows[rowIndex], id: \.self) { interest in
                                        Text(interest)
                                            .font(.system(size: 14, weight: .regular, design: .default))
                                            .foregroundColor(internalInterests.contains(interest) ? Color.themeColors.primary :
                                                                Color.themeColors.darkGrey)
                                            .padding(.vertical, 12)
                                            .padding(.horizontal, 16)
                                            .background {
                                                RoundedRectangle(cornerRadius: 50)
                                                    .fill(internalInterests.contains(interest) ?
                                                          Color.themeColors.lightGreen.opacity(0.3) : .white)
                                                    .overlay(
                                                        RoundedRectangle(cornerRadius: 50)
                                                            .stroke(internalInterests.contains(interest) ? Color.themeColors.lightGreen :
                                                                        Color.themeColors.lightGrey, lineWidth: 1))
                                            }
                                            .fixedSize(horizontal: true, vertical: false)
                                            .scaleEffect(internalInterests.contains(interest) ? 1.05 : 1.0)
                                            .animation(.spring(response: 0.3, dampingFraction: 0.5), value: internalInterests.contains(interest))
                                            .onTapGesture {
                                                withAnimation {
                                                    handleItemSelection(interest: interest)
                                                }
                                            }
                                    }
                                }
                            }
                        }
                        .padding(.horizontal, horizontalPadding)
                    }.redacted(reason: isLoading ? .placeholder : [])
                     .padding(.top, 4)
                }

                    HamztWaslButton(title: Constants.AIEngineConstants.save,
                                    buttonAction: {
                        interestes = internalInterests.filter { !$0.isEmpty }.joined(separator: ", ")
                        isPresented = false
                    }).buttonStyle(MainButtonStyle())
                    .padding(.horizontal, 16)
                    
                }.padding(.vertical, 24)
                 .background(Color.white)
                 .roundedCorner(20, corners: [.topLeft, .topRight])
                 .onAppear {
                    addLoadingEffect()
                    internalInterests = interestes.components(separatedBy: ",").map { $0.trimmingCharacters(in: .whitespaces) }
                }
                .onChange(of: interestes) { newValue in
                    internalInterests = newValue.components(separatedBy: ",").map { $0.trimmingCharacters(in: .whitespaces) }
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
    InterestsSelectionView(isPresented: .constant(true),
                           interestes: .constant(""))
}
