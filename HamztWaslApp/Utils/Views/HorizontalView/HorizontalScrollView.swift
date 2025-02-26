//
//  HorizontalScrollView.swift
//  HamztWaslApp
//
//  Created by Nour Gweda on 16/02/2025.
//

import SwiftUI

struct HorizontalScrollView<Content: View>: View {
    var alignment: VerticalAlignment = .center
    var horizontalSpacing: CGFloat = 0
    var horizontalPadding: CGFloat = 0

    @ViewBuilder let content: Content

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: alignment, spacing: horizontalSpacing) {
                content
                    .horizontalRTL()
            }
            .padding(.horizontal, horizontalPadding)
        }
        .flipsForRightToLeftLayoutDirection(true)
    }
}
