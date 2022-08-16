//
//  UserInformation.swift
//  FreeGames
//
//  Created by Nikolas Cardoso de Oliveira on 12/08/22.
//

import Foundation

class UserInformationDatabase {
    
    static let shared = UserInformationDatabase()
    
    private let userDefaults = UserDefaults.standard
    
    private let databaseKey = "FreeGamesUserInformation"
    
    var user: User?
    
    private init() {
        fetchFromDatabase()
    }
    
    private func isUserRegistered() -> Bool {
        if user == nil {
            return false
        }
        return true
    }
    
    func createOrUpdateUser(name: String?, email: String?, photoPath: String?) {
        if isUserRegistered() {
            updateUser(name: name, email: email, photoPath: photoPath)
        } else {
            user = User(name: name, email: email, photoPath: photoPath)
        }
        updateDatabase()
    }
    
    private func updateUser(name: String?, email: String?, photoPath: String?) {
        if name != nil {
            user?.name = name
        }
        
        if email != nil {
            user?.email = email
        }
        
        if photoPath != nil {
            user?.photoPath = photoPath
        }
    }
    
}

private extension UserInformationDatabase {
    
    func updateDatabase() {
        guard let jsonData = try? JSONEncoder().encode(user) else { return }
        
        userDefaults.setValue(jsonData, forKey: databaseKey)
    }
    
    func fetchFromDatabase() {
        guard let jsonData = userDefaults.data(forKey: databaseKey),
              let data = try? JSONDecoder().decode(User.self, from: jsonData)
        else { return }
        
        self.user = data
    }
    
}
