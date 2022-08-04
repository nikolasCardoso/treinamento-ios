//
//  Game.swift
//  FreeGames
//
//  Created by Nikolas Cardoso de Oliveira on 02/08/22.
//

import Foundation

struct Game: Codable {
    
    let id: Int
    let title: String
    let image: String
    let genre: String
    let platform: Platform
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case image = "thumbnail"
        case genre
        case platform
    }
}
