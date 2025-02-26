//
//  ResultView.swift
//  HamztWaslApp
//
//  Created by Nour Gweda on 26/02/2025.
//

import SwiftUI

struct ResultView: View {
    @State private var timer: Timer?

    @Binding var resultMessage: String
    var mode: ResultViewMode

    var body: some View {
        VStack {
            HStack(alignment: .center, spacing: 16) {
                Image(systemName: mode.getLeadingIcon())
                    .resizable()
                    .frame(width: 22, height: 22, alignment: .leading)
                    .foregroundColor(mode.getIconColor())
                    .padding(.leading, 16)

                Text(resultMessage)
                    .foregroundColor(.themeColors.primary)
                    .font(.system(size: 14, weight: .semibold, design: .default))
                    .multilineTextAlignment(.leading)

                 Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: 80, alignment: .center)
            .background(
                Color.themeColors.background
            )
            .cornerRadius(10)
            .padding(.horizontal, 16)
            Spacer()

        }
        .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 0)
        .isHidden(resultMessage.isEmpty, remove: true)
        .onChange(of: resultMessage) { _ in
            dismissView()
        }
    }

    private func dismissView() {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 2, repeats: false, block: { _ in
            withAnimation {
                self.resultMessage = ""
            }
        })
    }
}

enum ResultViewMode {

    case result, error

    func getLeadingIcon() -> String {
        switch self {
        case .result:
            return "checkmark.circle"
        case .error:
            return "exclamationmark.triangle"
        }
    }

    func getIconColor() -> Color {
        switch self {
        case .result:
            return Color.themeColors.primary
        case .error:
            return Color.themeColors.redColor
        }
    }
}
