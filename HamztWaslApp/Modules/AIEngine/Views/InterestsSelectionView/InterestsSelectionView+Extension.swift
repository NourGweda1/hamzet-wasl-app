//
//  InterestsSelectionView+Extension.swift
//  HamztWaslApp
//
//  Created by Nour Gweda on 18/02/2025.
//

import Foundation
import UIKit

extension InterestsSelectionView {
    func arrangeItemsIntoRows(items: [String], containerWidth: CGFloat) -> [[String]] {
        var rows: [[String]] = []
        var currentRow: [String] = []
        var currentRowWidth: CGFloat = 0
        
        let font = UIFont.systemFont(ofSize: 14)
        let attributes: [NSAttributedString.Key: Any] = [.font: font]
        
        for item in items {
            let textWidth = (item as NSString).size(withAttributes: attributes).width + 24
            
            if currentRowWidth + textWidth + spacing > containerWidth {
                rows.append(currentRow)
                currentRow = [item]
                currentRowWidth = textWidth
            } else {
                currentRow.append(item)
                currentRowWidth += textWidth + spacing
            }
        }
        
        if !currentRow.isEmpty {
            rows.append(currentRow)
        }
        
        return rows
    }

    func handleItemSelection(interest: String) {
       if internalInterests.contains(interest) {
           internalInterests.removeAll(where: { $0 == interest })
       } else {
           internalInterests.append(interest)
       }
    }

    func addLoadingEffect() {
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
            isLoading = false
        }
    }
}
