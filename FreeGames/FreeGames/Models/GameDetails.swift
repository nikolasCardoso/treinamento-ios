//
//  GameDetails.swift
//  FreeGames
//
//  Created by Nikolas Cardoso de Oliveira on 05/08/22.
//

import Foundation

struct GameDetails: Codable {
    
    let id: Int
    let title: String
    let description: String
    let image: String
    let url: String
    let genre: String
    let platform: Platform
    let developer: String
    let publisher: String
    let releaseDate: String
    let minSysReq: MinimumSystemRequirements?
    
    var hasSystemRequirements: Bool {
        minSysReq != nil ? true : false
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case description = "short_description"
        case image = "thumbnail"
        case url = "game_url"
        case genre
        case platform
        case developer
        case publisher
        case releaseDate = "release_date"
        case minSysReq = "minimum_system_requirements"
    }
    
}

struct MinimumSystemRequirements: Codable {
    
    let os: String?
    let processor: String?
    let storage: String?
    let memory: String?
    let graphics: String?
    
    enum CodingKeys: String, CodingKey {
        case os
        case processor
        case storage
        case memory
        case graphics
    }
    
}
