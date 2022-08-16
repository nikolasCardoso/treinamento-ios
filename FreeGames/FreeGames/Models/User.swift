//
//  User.swift
//  FreeGames
//
//  Created by Nikolas Cardoso de Oliveira on 12/08/22.
//

import Foundation

struct User: Codable {
    
    var name: String?
    var email: String?
    var photoPath: String?
    
}

enum UserInformations {
    case name
    case email
    case photoPath
}
