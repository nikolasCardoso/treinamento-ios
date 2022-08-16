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
    let description: String
    let image: String
    let genre: String
    let platform: Platform
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case description = "short_description"
        case image = "thumbnail"
        case genre
        case platform
    }
    
}
