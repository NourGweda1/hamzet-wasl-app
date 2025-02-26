//
//  IconAndTextView.swift
//  HamztWaslApp
//
//  Created by Nour Gweda on 16/02/2025.
//

import SwiftUI

struct IconAndTextView: View {

    let title: String
    let size: CGFloat
    var isSystemImage: Bool = false
    var systemImage: String?
    var customImage: String?
    var imageColor: Color?
    var fontColor: Color?

    var body: some View {
        HStack(spacing: 8) {
            Image(systemName: systemImage ?? "")
                .frame(width: size, height: size)
                .foregroundColor(imageColor)
                .isHidden(!isSystemImage, remove: false)

            Image(customImage ?? "")
                .resizable()
                .frame(width: size, height: size)
                .isHidden(isSystemImage, remove: false)

            Text(title)
                .font(.system(size: 13, weight: .regular, design: .default))
                .foregroundColor(fontColor ?? .lightGrey)
        }
    }
}

#Preview {
    IconAndTextView(title: "title",
                    size: 45)
}
