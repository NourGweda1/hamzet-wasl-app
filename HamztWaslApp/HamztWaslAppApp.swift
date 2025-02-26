//
//  HamztWaslAppApp.swift
//  HamztWaslApp
//
//  Created by Nour Gweda on 12/02/2025.
//

import SwiftUI

@main
struct HamztWaslAppApp: App {

    @StateObject var userSession = UserSession.shared

    var body: some Scene {
        WindowGroup {
            CustomNavigationView {
                SignInWidget()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .environmentObject(userSession)
            }.navigationViewStyle(.stack)
        }
    }
}
