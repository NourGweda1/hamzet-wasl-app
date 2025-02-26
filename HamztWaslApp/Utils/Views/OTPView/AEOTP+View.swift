//
//  AEOTP+View.swift
//  HamztWaslApp
//
//  Created by Nour Gweda on 22/02/2025.
//

import SwiftUI

@available(iOS 13.0, *)
extension View {
    @_disfavoredOverload
    @ViewBuilder public func onChange<V>(of value: V,
                                         perform action: @escaping (V) -> Void) -> some View where V: Equatable {
        if #available(iOS 14, *) {
            onChange(of: value, perform: action)
        } else {
            modifier(ChangeObserver(newValue: value, action: action))
        }
    }
}
