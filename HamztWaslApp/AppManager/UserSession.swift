//
//  UserSession.swift
//  HamztWaslApp
//
//  Created by Nour Gweda on 22/02/2025.
//

import SwiftUI
import CoreData

class UserSession: ObservableObject {
    static let shared = UserSession() // Singleton instance
    
    @Published var currentUser: User? // Holds the retrieved user

    private init() {} // Prevent external instances

    // Log out user
    func logout() {
        DispatchQueue.main.async {
            self.currentUser = nil
        }
    }
}
