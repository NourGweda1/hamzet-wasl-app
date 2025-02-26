//
//  String+Emoji.swift
//  HamztWaslApp
//
//  Created by Nour Gweda on 26/02/2025.
//

import Foundation

extension Character {
    var isEmoji: Bool {
        unicodeScalars.allSatisfy { scalar in
            switch scalar.value {
            case 0x1F600...0x1F64F, // Emoticons
                 0x1F300...0x1F5FF, // Misc Symbols and Pictographs
                 0x1F680...0x1F6FF, // Transport and Map
                 0x1F700...0x1F77F, // Alchemical Symbols
                 0x1F780...0x1F7FF, // Geometric Shapes Extended
                 0x1F800...0x1F8FF, // Supplemental Arrows-C
                 0x1F900...0x1F9FF, // Supplemental Symbols and Pictographs
                 0x1FA00...0x1FA6F, // Chess Symbols
                 0x1FA70...0x1FAFF, // Symbols and Pictographs Extended-A
                 0x2600...0x26FF,   // Misc Symbols
                 0x2700...0x27BF,   // Dingbats
                 0xFE00...0xFE0F,   // Variation Selectors
                 0x1F1E6...0x1F1FF: // Flags (iOS)
                return false
            default:
                return true
            }
        }
    }
}

extension String {
    func removingEmojis() -> String {
        return self.unicodeScalars.filter { !$0.properties.isEmojiPresentation }.map { String($0) }.joined()
    }
}
