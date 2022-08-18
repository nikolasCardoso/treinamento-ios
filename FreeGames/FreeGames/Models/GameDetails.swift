//
//  GameDetails.swift
//  FreeGames
//
//  Created by Nikolas Cardoso de Oliveira on 05/08/22.
//

import Foundation

struct GameDetails: Codable, Equatable {
    
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
    
    static func ==(lhs: Self, rhs: Self) -> Bool {
        lhs.id == rhs.id &&
        lhs.title == rhs.title &&
        lhs.description == rhs.description &&
        lhs.image == rhs.image &&
        lhs.url == rhs.url &&
        lhs.genre == rhs.genre &&
        lhs.platform == rhs.platform &&
        lhs.developer == rhs.developer &&
        lhs.publisher == rhs.publisher &&
        lhs.releaseDate == rhs.releaseDate &&
        lhs.minSysReq == rhs.minSysReq
    }
    
}

struct MinimumSystemRequirements: Codable, Equatable {
    
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
    
    static func ==(lhs: Self, rhs: Self) -> Bool {
        lhs.os == rhs.os &&
        lhs.processor == rhs.processor &&
        lhs.storage == rhs.storage &&
        lhs.memory == rhs.memory &&
        lhs.graphics == rhs.graphics
    }
    
}
