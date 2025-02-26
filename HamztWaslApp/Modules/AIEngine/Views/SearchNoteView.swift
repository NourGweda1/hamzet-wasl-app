//
//  SearchNoteView.swift
//  HamztWaslApp
//
//  Created by Nour Gweda on 17/02/2025.
//

import SwiftUI

struct SearchNoteView: View {

    @Binding var note: String
    @Binding var isNoteValid: Bool

    var body: some View {
        ZStack(alignment: .topLeading) {
            TextEditor(text: $note)
                .font(.system(size: 14, weight: .regular, design: .default))
                .foregroundColor(.themeColors.primary)
                .multilineTextAlignment(.leading)
                .colorMultiply(Color.themeColors.background)
                .padding(.horizontal, -5)

            Text(note.isEmpty ? Constants.AIEngineConstants.describeYourEvent : "")
                .padding(.top, 8)
                .font(.system(size: 14, weight: .regular, design: .default))
                .foregroundColor(.themeColors.lightGrey)
                .multilineTextAlignment(.leading)

        }.frame(height: 100)
         .padding(15)
         .background(Color.themeColors.background)
         .cornerRadius(11)
         .overlay(
             RoundedRectangle(cornerRadius: 11)
                .stroke(isNoteValid ? Color.themeColors.lightGrey : Color.themeColors.redColor, lineWidth: 1)
        )
    }
}

#Preview {
    SearchNoteView(note: .constant(""),
                   isNoteValid: .constant(true))
}
