//
//  CoreDataManager.swift
//  HamztWaslApp
//
//  Created by Nour Gweda on 22/02/2025.
//
import CoreData
import SwiftUI

class CoreDataManager {
    static let shared = CoreDataManager()
    
    let container: NSPersistentContainer
    let context: NSManagedObjectContext
    
    init() {
        container = NSPersistentContainer(name: "CoreDataModel")
        container.loadPersistentStores { _, error in
            if let error = error {
                fatalError("Failed to load Core Data stack: \(error)")
            }
        }
        context = container.viewContext
        preloadDefaultUsers()
    }

    // Save a new user
    func saveUser(id: Int64, name: String, email: String, password: String, otp: String, image: String) {
        let user = User(context: context)
        user.id = id
        user.name = name
        user.email = email
        user.password = password
        user.otp = otp
        user.image = image
        
        saveContext()
    }

    // Retrieve user by email or ID
    func getUser(email: String) -> Bool {
        let request: NSFetchRequest<User> = User.fetchRequest()
        request.predicate = NSPredicate(format: "email == %@", email)

        do {
            if let user = try context.fetch(request).first {
                DispatchQueue.main.async {
                    UserSession.shared.currentUser = user // Set shared user
                }
                return true // User found
            }
        } catch {
            print("Failed to fetch user: \(error)")
        }
        return false // User not found
    }

    // Save changes
    private func saveContext() {
        do {
            try context.save()
        } catch {
            print("Failed to save user: \(error)")
        }
    }

    // Preload two default users
    private func preloadDefaultUsers() {
        let fetchRequest: NSFetchRequest<User> = User.fetchRequest()
        do {
            let count = try context.count(for: fetchRequest)
            if count == 0 { 
                saveUser(id: 1,
                         name: "Nour Gweda",
                         email: "nour.gweda@trianglz.com",
                         password: "Nour1997!",
                         otp: "247096",
                         image: IconsConstants.UserConstantsIcons.nourProfileIC)
                saveUser(id: 2,
                         name: "Sherin Medhat",
                         email: "sherin.medhat@trianglz.com",
                         password: "Sherin2025!",
                         otp: "135622",
                         image: IconsConstants.UserConstantsIcons.sherineProfileIC)
            }
        } catch {
            print("Failed to check existing users: \(error)")
        }
    }
}
