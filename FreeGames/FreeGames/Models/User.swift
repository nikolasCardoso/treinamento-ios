//
//  User.swift
//  FreeGames
//
//  Created by Nikolas Cardoso de Oliveira on 12/08/22.
//

import Foundation

struct User: Codable, Equatable {
    
    var name: String?
    var email: String?
    var photoPath: String?
    
    static func ==(lhs: Self, rhs: Self) -> Bool {
        lhs.name == rhs.name &&
        lhs.email == rhs.email &&
        lhs.photoPath == rhs.photoPath
    }
    
}

enum UserInformations {
    case name
    case email
    case photoPath
}
